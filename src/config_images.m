function imgs=config_images(path)


    img_lytro =[[strcat(path,"/lytro_01/lytro_01_A.jpg"), strcat(path,"/lytro_01/lytro_01_B.jpg")],...
                [strcat(path,"/lytro_02/lytro_02_A.jpg"), strcat(path,"/lytro_02/lytro_02_B.jpg")],...
                [strcat(path,"/lytro_03/lytro_03_A.jpg"), strcat(path,"/lytro_03/lytro_03_B.jpg")],...
                [strcat(path,"/lytro_04/lytro_04_A.jpg"), strcat(path,"/lytro_04/lytro_04_B.jpg")],...
                [strcat(path,"/lytro_05/lytro_05_A.jpg"), strcat(path,"/lytro_05/lytro_05_B.jpg")],...
                [strcat(path,"/lytro_06/lytro_06_A.jpg"), strcat(path,"/lytro_06/lytro_06_B.jpg")],...
                [strcat(path,"/lytro_07/lytro_07_A.jpg"), strcat(path,"/lytro_07/lytro_07_B.jpg")],...
                [strcat(path,"/lytro_08/lytro_08_A.jpg"), strcat(path,"/lytro_08/lytro_08_B.jpg")],...
                [strcat(path,"/lytro_09/lytro_09_A.jpg"), strcat(path,"/lytro_09/lytro_09_B.jpg")],...
                [strcat(path,"/lytro_10/lytro_10_A.jpg"), strcat(path,"/lytro_10/lytro_10_B.jpg")],...
                [strcat(path,"/lytro_11/lytro_11_A.jpg"), strcat(path,"/lytro_11/lytro_11_B.jpg")],...
                [strcat(path,"/lytro_12/lytro_12_A.jpg"), strcat(path,"/lytro_12/lytro_12_B.jpg")],...
                [strcat(path,"/lytro_13/lytro_13_A.jpg"), strcat(path,"/lytro_13/lytro_13_B.jpg")],...
                [strcat(path,"/lytro_14/lytro_14_A.jpg"), strcat(path,"/lytro_14/lytro_14_B.jpg")],...
                [strcat(path,"/lytro_15/lytro_15_A.jpg"), strcat(path,"/lytro_15/lytro_15_B.jpg")],...
                [strcat(path,"/lytro_16/lytro_16_A.jpg"), strcat(path,"/lytro_16/lytro_16_B.jpg")],...
                [strcat(path,"/lytro_17/lytro_17_A.jpg"), strcat(path,"/lytro_17/lytro_17_B.jpg")],...
                [strcat(path,"/lytro_18/lytro_18_A.jpg"), strcat(path,"/lytro_18/lytro_18_B.jpg")],...
                [strcat(path,"/lytro_19/lytro_19_A.jpg"), strcat(path,"/lytro_19/lytro_19_B.jpg")],...
                [strcat(path,"/lytro_20/lytro_20_A.jpg"), strcat(path,"/lytro_20/lytro_20_B.jpg")]];

    img_mffw = [[strcat(path,"/mffw_01/mffw_01_A.jpg"), strcat(path,"/mffw_01/mffw_01_B.jpg")],...
                [strcat(path,"/mffw_02/mffw_02_A.jpg"), strcat(path,"/mffw_02/mffw_02_B.jpg")],...
                [strcat(path,"/mffw_03/mffw_03_A.jpg"), strcat(path,"/mffw_03/mffw_03_B.jpg")],...
                [strcat(path,"/mffw_04/mffw_04_A.jpg"), strcat(path,"/mffw_04/mffw_04_B.jpg")],...
                [strcat(path,"/mffw_05/mffw_05_A.jpg"), strcat(path,"/mffw_05/mffw_05_B.jpg")],...
                [strcat(path,"/mffw_06/mffw_06_A.jpg"), strcat(path,"/mffw_06/mffw_06_B.jpg")],...
                [strcat(path,"/mffw_07/mffw_07_A.jpg"), strcat(path,"/mffw_07/mffw_07_B.jpg")],...
                [strcat(path,"/mffw_08/mffw_08_A.jpg"), strcat(path,"/mffw_08/mffw_08_B.jpg")],...
                [strcat(path,"/mffw_09/mffw_09_A.jpg"), strcat(path,"/mffw_09/mffw_09_B.jpg")],...
                [strcat(path,"/mffw_10/mffw_10_A.jpg"), strcat(path,"/mffw_10/mffw_10_B.jpg")],...
                [strcat(path,"/mffw_11/mffw_11_A.jpg"), strcat(path,"/mffw_11/mffw_11_B.jpg")],...
                [strcat(path,"/mffw_12/mffw_12_A.jpg"), strcat(path,"/mffw_12/mffw_12_B.jpg")],...
                [strcat(path,"/mffw_13/mffw_13_A.jpg"), strcat(path,"/mffw_13/mffw_13_B.jpg")]];

    img_mfi =  [[strcat(path,"/MFI-WHU_01/MFI-WHU_01_A.jpg"), strcat(path,"/MFI-WHU_01/MFI-WHU_01_B.jpg")],...
                [strcat(path,"/MFI-WHU_02/MFI-WHU_02_A.jpg"), strcat(path,"/MFI-WHU_02/MFI-WHU_02_B.jpg")],...
                [strcat(path,"/MFI-WHU_03/MFI-WHU_03_A.jpg"), strcat(path,"/MFI-WHU_03/MFI-WHU_03_B.jpg")],...
                [strcat(path,"/MFI-WHU_04/MFI-WHU_04_A.jpg"), strcat(path,"/MFI-WHU_04/MFI-WHU_04_B.jpg")],...
                [strcat(path,"/MFI-WHU_05/MFI-WHU_05_A.jpg"), strcat(path,"/MFI-WHU_05/MFI-WHU_05_B.jpg")],...
                [strcat(path,"/MFI-WHU_06/MFI-WHU_06_A.jpg"), strcat(path,"/MFI-WHU_06/MFI-WHU_06_B.jpg")],...
                [strcat(path,"/MFI-WHU_07/MFI-WHU_07_A.jpg"), strcat(path,"/MFI-WHU_07/MFI-WHU_07_B.jpg")],...
                [strcat(path,"/MFI-WHU_08/MFI-WHU_08_A.jpg"), strcat(path,"/MFI-WHU_08/MFI-WHU_08_B.jpg")],...
                [strcat(path,"/MFI-WHU_09/MFI-WHU_09_A.jpg"), strcat(path,"/MFI-WHU_09/MFI-WHU_09_B.jpg")],...
                [strcat(path,"/MFI-WHU_10/MFI-WHU_10_A.jpg"), strcat(path,"/MFI-WHU_10/MFI-WHU_10_B.jpg")],...
                [strcat(path,"/MFI-WHU_11/MFI-WHU_11_A.jpg"), strcat(path,"/MFI-WHU_11/MFI-WHU_11_B.jpg")],...
                [strcat(path,"/MFI-WHU_12/MFI-WHU_12_A.jpg"), strcat(path,"/MFI-WHU_12/MFI-WHU_12_B.jpg")],...
                [strcat(path,"/MFI-WHU_13/MFI-WHU_13_A.jpg"), strcat(path,"/MFI-WHU_13/MFI-WHU_13_B.jpg")],...
                [strcat(path,"/MFI-WHU_14/MFI-WHU_14_A.jpg"), strcat(path,"/MFI-WHU_14/MFI-WHU_14_B.jpg")],...
                [strcat(path,"/MFI-WHU_15/MFI-WHU_15_A.jpg"), strcat(path,"/MFI-WHU_15/MFI-WHU_15_B.jpg")],...
                [strcat(path,"/MFI-WHU_16/MFI-WHU_16_A.jpg"), strcat(path,"/MFI-WHU_16/MFI-WHU_16_B.jpg")],...
                [strcat(path,"/MFI-WHU_17/MFI-WHU_17_A.jpg"), strcat(path,"/MFI-WHU_17/MFI-WHU_17_B.jpg")],...
                [strcat(path,"/MFI-WHU_18/MFI-WHU_18_A.jpg"), strcat(path,"/MFI-WHU_18/MFI-WHU_18_B.jpg")],...
                [strcat(path,"/MFI-WHU_19/MFI-WHU_19_A.jpg"), strcat(path,"/MFI-WHU_19/MFI-WHU_19_B.jpg")],...
                [strcat(path,"/MFI-WHU_20/MFI-WHU_20_A.jpg"), strcat(path,"/MFI-WHU_20/MFI-WHU_20_B.jpg")],...
                [strcat(path,"/MFI-WHU_21/MFI-WHU_21_A.jpg"), strcat(path,"/MFI-WHU_21/MFI-WHU_21_B.jpg")],...
                [strcat(path,"/MFI-WHU_22/MFI-WHU_22_A.jpg"), strcat(path,"/MFI-WHU_22/MFI-WHU_22_B.jpg")],...
                [strcat(path,"/MFI-WHU_23/MFI-WHU_23_A.jpg"), strcat(path,"/MFI-WHU_23/MFI-WHU_23_B.jpg")],...
                [strcat(path,"/MFI-WHU_24/MFI-WHU_24_A.jpg"), strcat(path,"/MFI-WHU_24/MFI-WHU_24_B.jpg")],...
                [strcat(path,"/MFI-WHU_25/MFI-WHU_25_A.jpg"), strcat(path,"/MFI-WHU_25/MFI-WHU_25_B.jpg")],...
                [strcat(path,"/MFI-WHU_26/MFI-WHU_26_A.jpg"), strcat(path,"/MFI-WHU_26/MFI-WHU_26_B.jpg")],...
                [strcat(path,"/MFI-WHU_27/MFI-WHU_27_A.jpg"), strcat(path,"/MFI-WHU_27/MFI-WHU_27_B.jpg")],...
                [strcat(path,"/MFI-WHU_28/MFI-WHU_28_A.jpg"), strcat(path,"/MFI-WHU_28/MFI-WHU_28_B.jpg")],...
                [strcat(path,"/MFI-WHU_29/MFI-WHU_29_A.jpg"), strcat(path,"/MFI-WHU_29/MFI-WHU_29_B.jpg")],...
                [strcat(path,"/MFI-WHU_30/MFI-WHU_30_A.jpg"), strcat(path,"/MFI-WHU_30/MFI-WHU_30_B.jpg")]];
    

    imgs = [img_lytro, img_mffw, img_mfi];

end