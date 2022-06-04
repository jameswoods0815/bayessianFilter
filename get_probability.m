function[cheetah_prob,grass_prob]=get_probablity()
load TrainingSamplesDCT_8_new.mat;
[rows_grass,cols_grass]=size(TrainsampleDCT_BG);
[rows_cheetah, cols_cheetah]=size(TrainsampleDCT_FG);
cheetah_prob=rows_cheetah*1.0/(rows_cheetah+rows_grass*1.0);
grass_prob=1-cheetah_prob;
end

