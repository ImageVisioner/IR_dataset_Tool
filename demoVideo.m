close all
clc 
clear all

% 定义图像所在的文件夹路径
image_folder = 'F:\OneDrive_1_2024-3-2\dirtroad_01\lwir\';

% 定义输出视频的路径和名称
output_video_filename = 'F:\OneDrive_1_2024-3-2\dirtroad_01\lwir\';

% 创建一个VideoWriter对象，'Motion JPEG AVI'是视频格式
video = VideoWriter(output_video_filename, 'Motion JPEG AVI');

% 设定视频的帧率
video.FrameRate = 25; % 例如，使用25帧/秒的帧率

% 打开VideoWriter对象，准备写视频
open(video);

% 获取文件夹中所有图片文件的信息
images = dir(fullfile(image_folder, 'image*.png')); % 假设图片是jpg格式

% 按文件名排序（可选，如果文件名不是用零填充的数字可能需要这一步）
[~, ind] = sort({images.name});
images = images(ind);

% 创建视频文件
for idx = 1:length(images)
    disp(idx)
    % 构建每个图像的完整路径
    image_name = images(idx).name;
    image_path = fullfile(image_folder, image_name);
    
    % 读取图像
    img = imread(image_path);
    
    % 将图像写入视频
    writeVideo(video, img);
end

% 关闭VideoWriter对象
close(video);

% 输出表示任务完成的信息
disp('Video writing completed.');