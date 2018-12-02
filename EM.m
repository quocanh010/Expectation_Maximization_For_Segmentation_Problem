S = load('TrainingSamplesDCT_8_new.mat');
Cheetah = S.TrainsampleDCT_FG;
Background = S.TrainsampleDCT_BG;


[max_c, ~] = size(Cheetah);
[max_b, ~] = size(Background);

cov_Cheetah = cell(5,8)
cov_Background = cell(5,8);
mu_Cheetah = cell(5,8);
mu_Background = cell(5,8);


Prior_Cheetah = zeros(5,8);
Prior_Background = zeros(5,8);



%Random initialize 5 mixtures
for n_mixt = 1:5
    r_c = rand(1,8);
    r_b = rand(1,8);
    for n_cltr = 8
        c = randi(max_c);
        b = randi(max_b);
        mu_Cheetah(n_mixt, n_cltr) = Cheetah(c,:);
        mu_Background(n_mixt,n_cltr) = Background(b,:);
        cov_Cheetah(n_mixt,n_cltr) = diag(c);
        cov_Background(n_mixt,n_cltr) = diag(b);
    end
    r_c = r_c / sum(r_c);
    r_b = r_b / sum(r_b);
    Prior_Cheetah(n_mixt,:) = r_c;
    Prior_Background(n_mixt,:) = r_b;
end

n_itr = 100;
%Iterate until convergence, which is either the log likelihood -does not change much or out of iterations


hj_C = zeros(size(Cheetah, 1));
hj_B = zeros(size(Background,1));

% %EM for Cheetah
% while(i <= n_itr)
%         %Expectation Step
%         for n_class = 1:8
%             
%         end 
%     
%     
%    
% end
% 
% 
% 
% img = imread('cheetah.bmp');
% img = im2double(img);
% %Vectorize 8-8 block with zig-zag patter
% % Padding to the image
% B = padarray(img, [7 7], 'symmetric','pre');
% dct_m = zeros(size(img, 1), size(img, 2), 64);
% 
% 
%  
% 
% n_itr = 100000;
% label_backgound = size(Background,2):1
% %Iterate until convergence, which is either the log likelihood -does not change much or out of iterations 
% while(i <= n_itr)
%     % Classification step
%         for n_s = 1:size(Background,2)
%             for n_class = 1:8
%                 if (n_class = 1)
%                     bdr_max = (temp_v - mu_Background[][])' * ((B_cov_CT) \ (temp_v - mun_1_CT)) + (log((2 * pi)^64 * det(B_cov_CT)) + Prior_Cheetah)
%                 else 
%             end 
%     
%         % Backgound
%     % Maximization Step
%     
%     if(log_change < 0.01)
%         
%     end  
% end
% 
% 



% %Calculating Piror Problability 
% Prior_Cheetah = size(Cheetah, 1) / (size(Cheetah,1) + size(Background, 1));
% Prior_Background = size(Background, 1) / (size(Cheetah,1) + size(Background, 1));
% 
% %Calculate the mean for each feature
% mean_Cheetah    = mean(Cheetah, 1);
% mean_Background = mean(Background, 1);
% 
% %Find covariance matrix for each class
% cov_Cheetah = cov(Cheetah);
% cov_Background = cov(Background);