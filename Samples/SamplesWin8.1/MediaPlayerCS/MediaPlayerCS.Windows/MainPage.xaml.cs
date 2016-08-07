//*****************************************************************************
//
//	Copyright 2015 Microsoft Corporation
//
//	Licensed under the Apache License, Version 2.0 (the "License");
//	you may not use this file except in compliance with the License.
//	You may obtain a copy of the License at
//
//	http ://www.apache.org/licenses/LICENSE-2.0
//
//	Unless required by applicable law or agreed to in writing, software
//	distributed under the License is distributed on an "AS IS" BASIS,
//	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//	See the License for the specific language governing permissions and
//	limitations under the License.
//
//*****************************************************************************

using FFmpegInterop;

using System;
using System.IO;
using System.Net;
using Windows.Foundation.Collections;
using Windows.Media.Core;
using Windows.Storage;
using Windows.Storage.Pickers;
using Windows.Storage.Streams;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;

namespace MediaPlayerCS
{
    public sealed partial class MainPage : Page
    {
        private FFmpegInteropMSS FFmpegMSS;
        private bool forceDecodeAudio = false;
        private bool forceDecodeVideo = false;

        public MainPage()
        {
            this.InitializeComponent();

            // Show the TopAppBar on startup so user can start opening media
            this.TopAppBar.IsOpen = true;

            Loaded += OnLoaded;
        }

        private void OnLoaded(object sender, RoutedEventArgs e)
        {
            //txtUrl.Text = "rtsp://ionutdanila:hbf5ukcy@192.168.0.102/img/media.sav";
            //txtUrl.Text = "http://192.168.0.102/img/media.flv";
            //txtUrl.Text = "http://192.168.0.102/img/sc_flvplayer.swf?vesion=v1.0.03";
            txtUrl.Text = $"http://192.168.0.102/img/media-sc-ts-{DateTime.Now.ToFileTimeUtc()}.flv";
            //txtUrl.Text = "rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov";
        }

        private async void AppBarButton_Browse_Click(object sender, RoutedEventArgs e)
        {
            FileOpenPicker filePicker = new FileOpenPicker();
            filePicker.ViewMode = PickerViewMode.Thumbnail;
            filePicker.SuggestedStartLocation = PickerLocationId.VideosLibrary;
            filePicker.FileTypeFilter.Add("*");

            // Show file picker so user can select a file
            StorageFile file = await filePicker.PickSingleFileAsync();

            if (file != null)
            {
                mediaElement.Stop();

                // Open StorageFile as IRandomAccessStream to be passed to FFmpegInteropMSS
                IRandomAccessStream readStream = await file.OpenAsync(FileAccessMode.Read);

                try
                {
                    // Instantiate FFmpeg object and pass the stream from opened file
                    FFmpegMSS = FFmpegInteropMSS.CreateFFmpegInteropMSSFromStream(readStream, forceDecodeAudio, forceDecodeVideo);
                    MediaStreamSource mss = FFmpegMSS.GetMediaStreamSource();

                    if (mss != null)
                    {
                        // Pass MediaStreamSource to Media Element
                        mediaElement.SetMediaStreamSource(mss);
                    }
                    else
                    {
                        DisplayErrorMessage("Cannot open media");
                    }
                }
                catch (Exception ex)
                {
                    DisplayErrorMessage(ex.Message);
                }
            }

            // Set the TopAppBar to non-sticky so it will hide automatically after first file open
            this.TopAppBar.IsSticky = false;
            this.TopAppBar.IsOpen = false;
        }

        private void AppBarButton_Audio_Click(object sender, RoutedEventArgs e)
        {
            AppBarToggleButton button = sender as AppBarToggleButton;
            forceDecodeAudio = button.IsChecked.Value;
        }

        private void AppBarButton_Video_Click(object sender, RoutedEventArgs e)
        {
            AppBarToggleButton button = sender as AppBarToggleButton;
            forceDecodeVideo = button.IsChecked.Value;
        }

        private void MediaElement_MediaEnded(object sender, RoutedEventArgs e)
        {
            // Show the TopAppBar when media has finished playing
            this.TopAppBar.IsOpen = true;
        }

        private void MediaElement_MediaFailed(object sender, ExceptionRoutedEventArgs e)
        {
            DisplayErrorMessage(e.ErrorMessage);
        }

        private async void DisplayErrorMessage(string message)
        {
            // Display error message
            var errorDialog = new MessageDialog(message);
            var x = await errorDialog.ShowAsync();
        }

        private void OnUrlChanged(object sender, TextChangedEventArgs e)
        {
            string url = (sender as TextBox).Text;

            if (string.IsNullOrEmpty(url))
                return;

            try
            {
                mediaElement.Stop();

                FFmpegMSS = FFmpegInteropMSS.CreateFFmpegInteropMSSFromUri(url, forceDecodeAudio, forceDecodeVideo);
                MediaStreamSource mss = FFmpegMSS.GetMediaStreamSource();

                if (mss != null)
                {
                    // Pass MediaStreamSource to Media Element
                    mediaElement.SetMediaStreamSource(mss);
                }
                else
                {
                    DisplayErrorMessage("Cannot open media");
                }
            }
            catch (Exception ex)
            {
                DisplayErrorMessage(ex.Message);
            }
        }
    }
}
