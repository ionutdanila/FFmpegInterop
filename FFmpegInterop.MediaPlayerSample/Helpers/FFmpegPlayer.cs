using System;
using System.Threading;
using System.Threading.Tasks;
using Windows.Foundation.Collections;
using Windows.Media.Core;

namespace FFmpegInterop.MediaPlayerSample.Helpers
{
    public class FFmpegPlayer
    {
        private FFmpegInteropMSS _ffmpegInterop;

        private static PropertySet FFmpegOptions => new PropertySet
        {
            { "rtsp_transport", "tcp" },
            { "rtsp_flags", "prefer_tcp" },
            { "fflags", "nobuffer+discardcorrupt+shortest+latm+sortdts+ignidx" },
        };

        private static FFmpegPlayer _instance;
        public static FFmpegPlayer Instance => _instance ?? (_instance = new FFmpegPlayer());

        public Task<MediaStreamSource> RetrieveMediaStreamSource(string streamUrl, bool removeAudio = false)
        {
            if (string.IsNullOrEmpty(streamUrl))
                return null;

            return Task.Run(async () =>
            {
                if (removeAudio)
                    FFmpegOptions.Add("allowed_media_types", "video");

                DisposeExistingInterop();

                _ffmpegInterop = await FFmpegInteropMSS.CreateFromUriAsync(streamUrl, new FFmpegInteropConfig
                {
                    FFmpegOptions = FFmpegOptions
                });
      
                return _ffmpegInterop?.GetMediaStreamSource();
            });
        }

        private void DisposeExistingInterop()
        {
            _ffmpegInterop = null;
        }
    }
}
