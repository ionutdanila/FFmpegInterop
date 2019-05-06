using FFmpegInterop.MediaPlayerSample.Helpers;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace FFmpegInterop.MediaPlayerSample
{
    public sealed partial class MainPage : Page
    {
        //private string streamUri = "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov";
        //private string streamUri = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
        private string streamUri = "http://mirrors.standaloneinstaller.com/video-sample/jellyfish-25-mbps-hd-hevc.m4v";

        public MainPage()
        {
            InitializeComponent();

            Loaded += OnLoaded;
        }

        private async void OnLoaded(object sender, RoutedEventArgs e)
        {
            Loaded -= OnLoaded;
            mediaElement.SetMediaStreamSource(await FFmpegPlayer.Instance.RetrieveMediaStreamSource(streamUri));
        }
    }
}
