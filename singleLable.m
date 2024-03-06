
clc 
close all
% 图像文件路径
imageName = './i/00000171_inf.png'
% 标注文件路径
annotationsFileName = 'groundTruth_v.txt'; % 替换为你的标注文件名

% 读取图像
img = imread(imageName);

% 打开标注文件并读取数据
fileID = fopen(annotationsFileName, 'r');
annotation = fscanf(fileID, '%d %d %d %d'); % 读取一行四个整数
fclose(fileID);

% 标注矩形框的左上角坐标和宽高
x = annotation(1);         % 左上角X坐标
y = annotation(2);         % 左上角Y坐标
box_width = annotation(3); % 矩形框宽度
box_height = annotation(4);% 矩形框高度

% 显示图像
imshow(img);
hold on; % 保持图像，以便绘制矩形框

% 根据标注数据在图像上绘制矩形框
rectangle('Position', [x, y, box_width, box_height], 'EdgeColor', 'r', 'LineWidth', 2);

hold off; % 取消hold状态