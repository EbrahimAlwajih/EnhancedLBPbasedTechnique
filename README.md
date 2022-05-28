
<!DOCTYPE html>
<html lang="en-US">
  <head>  
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="generator" content="Jekyll v3.9.2" />
<meta property="og:title" content="EnhancedLBPbasedTechnique" />
<meta property="og:locale" content="en_US" />
<meta name="description" content="An enhanced LBP-based technique with varies size of sliding window approach for handwritten Arabic digit recognition" />
<meta property="og:description" content="An enhanced LBP-based technique with varies size of sliding window approach for handwritten Arabic digit recognition" />
<link rel="canonical" href="https://ebrahimalwajih.github.io/EnhancedLBPbasedTechnique/" />
<meta property="og:url" content="https://ebrahimalwajih.github.io/EnhancedLBPbasedTechnique/" />
<meta property="og:site_name" content="EnhancedLBPbasedTechnique" />
<meta property="og:type" content="website" />
<meta name="twitter:card" content="summary" />
<meta property="twitter:title" content="EnhancedLBPbasedTechnique" />
<meta name="google-site-verification" content="VWM3VeSm3HkR2hBbPvXXgfg-1xdX-yjpBqDkNXAJSsc" />
<tilte EnhancedLBPbasedTechnique | An enhanced LBP-based technique with varies size of sliding window approach for handwritten Arabic digit recognition/>
	  <script type="application/ld+json">
{"@context":"https://schema.org","@type":"WebSite","description":"An enhanced LBP-based technique with varies size of sliding window approach for handwritten Arabic digit recognition","headline":"EnhancedLBPbasedTechnique","name":"EnhancedLBPbasedTechnique","url":"https://ebrahimalwajih.github.io/EnhancedLBPbasedTechnique/</script>

  </head>
  <body>
    <div class="container-lg px-3 my-5 markdown-body">
      <h1><a href="https://ebrahimalwajih.github.io/EnhancedLBPbasedTechnique/">EnhancedLBPbasedTechnique</a></h1>
      

      

<p>#Paper: 
An enhanced LBP-based technique with varies size of sliding window approach for handwritten Arabic digit recognition</p>

<ul>
  <li>
    <p>To cite this article: Al-wajih, E., Ghazali, R. An enhanced LBP-based technique with various size of sliding window approach for handwritten Arabic digit recognition. Multimed Tools Appl 80, 24399–24418 (2021). https://doi.org/10.1007/s11042-021-10762-x</p>
  </li>
  <li>
    <p>Source Code (MATLAB): <a href="https://github.com/EbrahimAlwajih/EnhancedLBPbasedTechnique">EnhancedLBPbasedTechnique
</a></p>
  </li>
  <li>
    <p>Abstract: Many variations of local binary pattern (LBP) were proposed to enhance its performance, including uniform local binary pattern (ULBP), center-symmetric local binary patterns (CS-LBP), center symmetric local ternary patterns (CS-LTP), center symmetric local multilevel pattern (CS-LMP), etc. In this paper, the accuracies of LBP technique and its variations are enhanced using four different sizes of a sliding window approach. This approach is used for investigating whether the features extracted by LBP are significant enough or its versions are needed as well. Five LBP-based techniques have been used including LBP, CS-LBP, CS-LTP, CS-LMP, and U2LBP. They have been applied to an Arabic digit image dataset called MAHDBase. Support vector machine (SVM) and random forests are utilized as classifiers. The experimental results show that the obtained accuracies have been improved by 19.56%, 21.43%, 5.63%, 6.51% and 5.62% for CS-LBP, CS-LMP, U2LBP, CS-LTP, and LBP, respectively, when the sliding window approach has been applied and SVM with linear kernel has been used as a classifier. Moreover, the results show that there is no need to use LBP variations to enhance the accuracy if the sliding window is applied because the highest accuracy has been acquired using LBP. At the end, the accuracy of proposed systems has been compared against other state-of-the-art LBP-based techniques showing the significance of the proposed systems.</p>
  </li>
</ul>

<p><img src="https://user-images.githubusercontent.com/15468033/170826557-1f91e31b-60c4-48b3-a009-4c31436a7b23.png" alt="image" /></p>

<ul>
  <li>In this study, all experiments were implemented as the following. Digit image was scaled into 32x32 pixels and then a sliding window of 50% overlap was passed vertically and horizontally making local regions. Then, features were extracted from each region and then all features of every region were concatenated producing feature vectors. For classification, random forest and SVM classifiers were used to investigate and answer the research questions. Moreover, there are some important parameters for the classifiers which are “number of trees” and “number of features” for random forest and the kernel function for SVM. Random forest classifier was set up using 70 trees. In addition, the significant number of trees was proven to be between 64 and 128, and the subset of features have been defined using (⌊log_2⁡〖(#features)+1)〗 ⌋). Linear function was used as the kernel function in SVM.</li>
</ul>


      
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/4.1.0/anchor.min.js" integrity="sha256-lZaRhKri35AyJSypXXs4o6OPFTbTmUoltBbDCbdzegg=" crossorigin="anonymous"></script>
    <script>anchors.add();</script>
  </body>
</html>
