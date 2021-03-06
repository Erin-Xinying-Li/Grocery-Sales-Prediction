library(readxl)
library(xlsx)
library(earth)
library(dplyr)
library(gbm)

files=list.files(pattern="*.xlsx")
store=lapply(files,read_excel) 
RMSE=matrix(0,8,24)
for (j in 1:8) {
  attach(store[[j]])
  F_=cbind(F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,F23,F24)
  D=cbind(D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24)
  PR=cbind(PR1,PR2,PR3,PR4,PR5,PR6,PR7,PR8,PR9,PR10,PR11,PR12,PR13,PR14,PR15,PR16,PR17,PR18,PR19,PR20,PR21,PR22,PR23,PR24)
  P=cbind(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P24)
  Y=cbind(Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y18,Y19,Y20,Y21,Y22,Y23,Y24)
  F_train=filter(data.frame(F_),Random =='Train')
  F_test=filter(data.frame(F_),Random =='Test')
  D_train=filter(data.frame(D),Random =='Train')
  D_test=filter(data.frame(D),Random =='Test')
  PR_train=filter(data.frame(PR),Random =='Train')
  PR_test=filter(data.frame(PR),Random =='Test')
  P_train=filter(data.frame(P),Random =='Train')
  P_test=filter(data.frame(P),Random =='Test')
  Y_train=filter(data.frame(Y),Random =='Train')
  Y_test=filter(data.frame(Y),Random =='Test')
  
  train = data.frame(F_train, D_train, PR_train, P_train)
  test=data.frame(F_test, D_test, PR_test, P_test)
  for (i in 1:24) {
    y=Y_train[,i]
    y_test = Y_test[,i]
    model =gbm(y~.,data=train,distribution="gaussian", n.trees=500,interaction.depth=6,shrinkage = 0.01)
    predict=predict(model,newdata=test,n.trees=1000)
    RMSE[j,i]=sqrt(mean((y_test-predict)^2))
  }
  detach(store[[j]])
}
write.xlsx(RMSE, "boosted_MSE.xlsx", sheetName="1000trees_6depth_0.01", col.names=TRUE, row.names=TRUE, append=TRUE)