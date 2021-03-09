clc;
% %
result = cell(45, 2);
kernal={'tree' 'linear' 'RBF'};
databasetype={'MHAD'};
for type_idx=1:length(databasetype)
    for kernal_idx=1:length(kernal)
        result = cell(45, 2);
        Test_path=fullfile(databasetype{type_idx}, 'Test');
        Train_path=fullfile(databasetype{type_idx}, 'Train');
        Result_path=fullfile(databasetype{type_idx},'MatResults');
        
        Preproc_folders = dir(Train_path);
        for pre_idx=3:length(Preproc_folders)%:-1:3
            Preproc_folders(pre_idx).name
            TrainData =load(fullfile(Train_path,Preproc_folders(pre_idx).name));%Preproc_folders(pre_idx).name));
            TrainData = struct2cell(TrainData);
            TrainData=TrainData{1};
            Y=TrainData(:,size(TrainData,2));
            TrainData(:,size(TrainData,2))=[];
            
            [TrainData,max_a,min_a]=Normalize_matrix(TrainData);
            rng(1); % For reproducibility
            
            disp('Training Data');
            if (kernal_idx==1)
                SVMModelsj = TreeBagger(70,TrainData,Y);
            else
                t = templateSVM('Standardize',false,'KernelFunction',kernal{kernal_idx},'Prior','uniform','Solver','SMO');%--
                SVMModelsj = fitcecoc(TrainData,Y,'Learners',t);%--
            end
            disp('Training Model is done');
            %
            TestData =load(fullfile(Test_path,Preproc_folders(pre_idx).name));%Preproc_folders(pre_idx).name));
            TestData = struct2cell(TestData);
            TestData=TestData{1};
            Yt=TestData(:,size(TestData,2));
            TestData(:,size(TestData,2))=[];
            TestData=Normalize_matrixForTest(TestData,max_a,min_a);
            disp('Size of training Data')
            size(TrainData)
            disp('Size of testing Data')
            size(TestData)
            
            [label,score] = predict(SVMModelsj,TestData);
            %     str2double
            if (kernal_idx==1)
                confMat = confusionmat(Yt, str2double(label));
            else
                confMat = confusionmat(Yt, (label));
            end
            accuracy= sum(diag(confMat)) / sum(sum(confMat));
            result{pre_idx-2,2}=accuracy;
            result{pre_idx-2,1}=Preproc_folders(pre_idx).name;
            mkdir(fullfile(Result_path,kernal{kernal_idx}));
            
        end
        
        xlswrite(fullfile(Result_path,kernal{kernal_idx},'Result.xlsx'),result);
    end
end