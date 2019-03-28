using FFmpegInterop.MediaPlayerSample.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.Media.Core;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

namespace FFmpegInterop.MediaPlayerSample
{
    public sealed partial class MainPage : Page
    {
        //private string streamUri = "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov";
        private string streamUri = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

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
