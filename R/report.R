setClass(
  Class='reportObj', 
  representation=representation( 
    title='characterOrNULL',
    origData='dataframeOrNULL',
    impFile='characterOrNULL',
    nrObs='numericOrNULL',
    tabKeyVars='dataframeOrNULL',
    sensiblecn='numericOrNULL',
    modCat='logicalOrNULL',
    modNum='logicalOrNULL',
    modPram='logicalOrNULL',
    modLocSupp='logicalOrNULL',
    
    pram.show='logical',
    pram.changedVars='listOrNULL',
    pram.totChanges='numericOrNULL',
    pram.percChanges='numericOrNULL',
    
    kAnon.show='logical',
    kAnon.two.anon='numericOrNULL',
    kAnon.two.anon.unmod='numericOrNULL',
    kAnon.three.anon='numericOrNULL',
    kAnon.three.anon.unmod='numericOrNULL',
    kAnon.two.anon.perc='numericOrNULL',
    kAnon.two.anon.unmod.perc='numericOrNULL',
    kAnon.three.anon.perc='numericOrNULL',
    kAnon.three.anon.unmod.perc='numericOrNULL',
    
    indivRisk.show='logical',
    indivRisk.expReidentifications='numericOrNULL',
    indivRisk.expReidentifications.perc='numericOrNULL',
    indivRisk.unmodified='numericOrNULL',
    indivRisk.highest='dataframeOrNULL',
    
    hierRisk.show='logical',
    hierRisk.expReindent='numericOrNULL',
    hierRisk.expReindent.perc='numericOrNULL',
    hierRisk.expReindentOrig='numericOrNULL',
    hierRisk.expReindentOrig.perc='numericOrNULL',
    
    riskNumKeyVars.show='logical',
    riskNumKeyVars.risk='numericOrNULL',
    
    dataUtility.show='logical',
    dataUtility.info='listOrNULL',
    
    localSupps.show='logical',
    localSupps.tab='dataframeOrNULL',
    
    dataUtilityCont.show='logical',
    dataUtilityCont.tabSummary='dataframeOrNULL',
    dataUtilityCont.IL1='numericOrNULL',
    dataUtilityCont.diffEigen='numericOrNULL',
    dataUtilityCont.plotName='characterOrNULL',
    
    code='listOrNULL',
    
    sessionInfo.show='logical',
    sessionInfo.info='listOrNULL'
  ),
  prototype=prototype(
    title='SDC-Report',
    origData=NULL,
    impFile=NULL,
    nrObs=NULL,
    sensiblecn=NULL,
    modCat=NULL,
    modNum=NULL,
    modPram=NULL,
    modLocSupp=NULL,
    
    pram.show=FALSE,
    pram.changedVars=NULL,
    pram.totChanges=NULL,
    pram.percChanges=NULL,      
    
    kAnon.show=FALSE,
    kAnon.two.anon=NULL,
    kAnon.two.anon.unmod=NULL,
    kAnon.three.anon=NULL,
    kAnon.three.anon.unmod=NULL,
    kAnon.two.anon.perc=NULL,
    kAnon.two.anon.unmod.perc=NULL,
    kAnon.three.anon.perc=NULL,
    kAnon.three.anon.unmod.perc=NULL,      
    
    indivRisk.show=FALSE,
    indivRisk.expReidentifications=NULL,
    indivRisk.expReidentifications.perc=NULL,
    indivRisk.unmodified=NULL,
    indivRisk.highest=NULL,      
    
    hierRisk.show=FALSE,
    hierRisk.expReindent=NULL,
    hierRisk.expReindent.perc=NULL,
    hierRisk.expReindentOrig=NULL,
    hierRisk.expReindentOrig.perc=NULL,
    
    riskNumKeyVars.show=FALSE,
    riskNumKeyVars.risk=NULL,
    
    dataUtility.show=FALSE,
    dataUtility.info=NULL,   
    
    localSupps.show=FALSE,
    localSupps.tab=NULL,     
    
    dataUtilityCont.show=FALSE,
    dataUtilityCont.tabSummary=NULL,
    dataUtilityCont.IL1=NULL,
    dataUtilityCont.diffEigen=NULL,
    dataUtilityCont.plotName=NULL,
    
    code=NULL,
    sessionInfo.show=TRUE,
    sessionInfo.info=NULL
  ),
  validity=function(object) {   
    return(TRUE)
  }
)

setGeneric('get.reportObj', function(object, type) {standardGeneric('get.reportObj')})
setMethod(f='get.reportObj', signature=c('reportObj', 'character'),
  definition=function(object, type) { 
    ind <- match(type, slotNames(object))
    if ( length(ind) == 1 ) {
      return(slot(object, type))
    } else {
      stop("get.reportObj:: argument 'type' is not valid!\n")
    }
  }
)

setGeneric('set.reportObj', function(object, type, input) {standardGeneric('set.reportObj')})
setMethod(f='set.reportObj', signature=c('reportObj', 'character', 'listOrNULL'),
  definition=function(object, type, input) { 
    ind <- match(type, slotNames(object))
    if ( length(ind) == 1 ) {
      slot(object, type) <- input[[1]]
    } else {
      stop("set.reportObj:: check argument 'type'!\n")
    }
    validObject(object)
    return(object)
  }
)

setGeneric('calcReportData',
  function(obj, internal=FALSE,title) {
    standardGeneric('calcReportData')
  }
)

setMethod(f='calcReportData', signature=c('sdcMicroObj'), definition=function(obj,internal,title) {
  repObj <- new("reportObj")
     
  if ( internal ) {
    repObj <- set.reportObj(repObj, "pram.show", list(TRUE))
    repObj <- set.reportObj(repObj, "kAnon.show", list(TRUE))
    repObj <- set.reportObj(repObj, "indivRisk.show", list(TRUE))
    repObj <- set.reportObj(repObj, "hierRisk.show", list(TRUE))
    repObj <- set.reportObj(repObj, "riskNumKeyVars.show", list(TRUE))
    repObj <- set.reportObj(repObj, "dataUtility.show", list(TRUE))
    repObj <- set.reportObj(repObj, "localSupps.show", list(TRUE))
    repObj <- set.reportObj(repObj, "dataUtilityCont.show", list(TRUE))
    repObj <- set.reportObj(repObj, "riskNumKeyVars.show", list(TRUE))
    repObj <- set.reportObj(repObj, "sessionInfo.show", list(TRUE))
  } else {
    repObj <- set.reportObj(repObj, "pram.show", list(FALSE))
    repObj <- set.reportObj(repObj, "kAnon.show", list(FALSE))
    repObj <- set.reportObj(repObj, "indivRisk.show", list(FALSE))
    repObj <- set.reportObj(repObj, "hierRisk.show", list(FALSE))
    repObj <- set.reportObj(repObj, "riskNumKeyVars.show", list(FALSE))
    repObj <- set.reportObj(repObj, "dataUtility.show", list(FALSE))
    repObj <- set.reportObj(repObj, "localSupps.show", list(FALSE))
    repObj <- set.reportObj(repObj, "dataUtilityCont.show", list(FALSE))
    repObj <- set.reportObj(repObj, "riskNumKeyVars.show", list(FALSE))  
    repObj <- set.reportObj(repObj, "sessionInfo.show", list(FALSE))
    
  }
  repObj <- set.reportObj(repObj, "title", list(title))
  
  x <- get.sdcMicroObj(obj, type="origData")
  repObj <- set.reportObj(repObj, "origData", list(x))
  y1 <- get.sdcMicroObj(obj, type="manipKeyVars")
  y2 <- get.sdcMicroObj(obj, type="manipNumVars")
  optionss <- get.sdcMicroObj(obj, type="options")
  
  #####################
  ### imported File ###
  #####################
  if ( "filename" %in% names(optionss) ) {
    repObj <- set.reportObj(repObj, "impFile", list(optionss$filename))
  }  
  
  y1cn <- get.sdcMicroObj(obj, type="keyVars")
  y1cn <- colnames(x)[y1cn]
  
  y2cn <- get.sdcMicroObj(obj, type="numVars")  
  y2cn <- colnames(x)[y2cn]
  
  if ( length(get.sdcMicroObj(obj, type="hhId")) > 0 ) {
    hhIdcn <- colnames(x)[get.sdcMicroObj(obj, type="hhId")]
  } else {
    hhIdcn <- "not defined"
  }
  if ( length(get.sdcMicroObj(obj, type="strataVar")) > 0 ) {
    stratacn <- colnames(x)[get.sdcMicroObj(obj, type="strataVar")]
  } else {
    stratacn <- "not defined"
  }
  n <- nrow(x)
  pCat <- length(get.sdcMicroObj(obj, "keyVars"))
  wind <- get.sdcMicroObj(obj, type="weightVar")
  if ( length(wind) > 0 ) {
    weightcn <- colnames(x)[wind]
  } else {
    weightcn <- "not defined"
  }
  
  ## information on categorical key-variables
  repObj <- set.reportObj(repObj, "nrObs", list(nrow(x)))
  maxcols <- max(c(length(y1cn), length(y2cn)))
  df <- data.frame(matrix(, ncol=maxcols, nrow=5))
  colnames(df) <- paste(1:maxcols)
  extend <- function(x, maxcols) {
    if(length(x) == maxcols) return(x) else return(c(x, rep("", maxcols-length(x))))
  }
  df[1,] <- extend(y1cn, maxcols)
  df[2,] <- extend(y2cn, maxcols)
  df[3,] <- extend(weightcn, maxcols)
  df[4,] <- extend(hhIdcn, maxcols)
  df[5,] <- extend(stratacn, maxcols)
  rownames(df) <- c("Categorical", "Continuous", "weight", "hhID", "strata")
  repObj <- set.reportObj(repObj, "tabKeyVars", list(df))
  repObj <- set.reportObj(repObj, "sensiblecn", list(get.sdcMicroObj(obj, "sensibleVar")))
  
  ## information about anonymisation methods
  modCat <- sum(!(x[,get.sdcMicroObj(obj, "keyVars")] == get.sdcMicroObj(obj, "manipKeyVars")), na.rm=TRUE) > 0
  modNum <- sum(!(x[,get.sdcMicroObj(obj, "numVars")] == get.sdcMicroObj(obj, "manipNumVars")), na.rm=TRUE) > 0
  modPram <- !is.null(get.sdcMicroObj(obj, "pram"))
  modLocSupp <- !is.null(get.sdcMicroObj(obj, "localSuppression"))   		
  
  repObj <- set.reportObj(repObj, "modCat", list(modCat))
  repObj <- set.reportObj(repObj, "modNum", list(modNum))
  repObj <- set.reportObj(repObj, "modPram", list(modPram))
  repObj <- set.reportObj(repObj, "modLocSupp", list(modLocSupp))
  
  ## information about disclosure risk and k-anonymity
  pram <- get.sdcMicroObj(obj, "pram")
  if ( is.null(pram) ) {
    repObj <- set.reportObj(repObj, "pram.show", list(FALSE))
  } 
  
  if ( get.reportObj(repObj, "pram.show") ) {
    changedVars <- list()
    for ( i in 1:length(obj@keyVars) ) {
      changedVars[[i]] <- list()
      s <- sum(x[,obj@keyVars[i]] != get.sdcMicroObj(obj, "manipKeyVars")[,i])
      p <- round(s/nrow(x)*100,2)
      changedVars[[i]]$oName <- colnames(x)[get.sdcMicroObj(obj, "keyVars")][i]
      changedVars[[i]]$nName <- paste(changedVars[[i]]$oName,".pramed")
      changedVars[[i]]$nr <- s
      changedVars[[i]]$perc <- p

      #changedVars[[i]] <- paste(colnames(x)[get.sdcMicroObj(obj, "keyVars")][i]," != ", colnames(x)[get.sdcMicroObj(obj, "keyVars")][i],".pramed"," : ",s," (",p,"\\%)","\n",sep="")
    }
    repObj <- set.reportObj(repObj, "pram.changedVars", list(changedVars))
    repObj <- set.reportObj(repObj, "pram.totChanges", list(sum(x[,get.sdcMicroObj(obj, "keyVars")] != get.sdcMicroObj(obj, "manipKeyVars"))))
    repObj <- set.reportObj(repObj, "pram.percChanges", list(round(100*sum(x[,get.sdcMicroObj(obj, "keyVars")] != get.sdcMicroObj(obj, "manipKeyVars"))/(n*pCat),4)))
  } 
  
  ## k-anonymity
  # if we pram, kAnon is useless
  if ( get.reportObj(repObj, "pram.show") ) {
    repObj <- set.reportObj(repObj, "kAnon.show", list(FALSE))
  }
  
  if ( get.reportObj(repObj, "kAnon.show") ) {
    n <- nrow(x)
    repObj <- set.reportObj(repObj, "kAnon.two.anon", list(sum(obj@risk$individual[,2]<2)))
    repObj <- set.reportObj(repObj, "kAnon.two.anon.unmod", list(sum(obj@originalRisk$individual[,2]<2)))
    repObj <- set.reportObj(repObj, "kAnon.three.anon", list(sum(obj@risk$individual[,2]<3)))
    repObj <- set.reportObj(repObj, "kAnon.three.anon.unmod", list(sum(obj@originalRisk$individual[,2]<3)))
    repObj <- set.reportObj(repObj, "kAnon.two.anon.perc", list(round(sum(obj@risk$individual[,2]<2)/n*100,2)))
    repObj <- set.reportObj(repObj, "kAnon.two.anon.unmod.perc", list(round(sum(obj@originalRisk$individual[,2]<2)/n*100,2)))
    repObj <- set.reportObj(repObj, "kAnon.three.anon.perc", list(round(sum(obj@risk$individual[,2]<3)/n*100,2)))
    repObj <- set.reportObj(repObj, "kAnon.three.anon.unmod.perc", list(round(sum(obj@originalRisk$individual[,2]<3)/n*100,2)))
  }
  
  ## information about individual risk
  if ( get.reportObj(repObj, "indivRisk.show") ) {
    risk <- get.sdcMicroObj(obj, type="risk")
    repObj <- set.reportObj(repObj, "indivRisk.expReidentifications", list(round(risk$global$risk*nrow(x))))
    repObj <- set.reportObj(repObj, "indivRisk.expReidentifications.perc", list(round(risk$global$risk_pct, 4)))
    
    ## TODO: save risk of original data and not renewly calculate it:
    if ( weightcn=="not defined" ) {
      weightcn <- NULL
    }
    ro <- measure_risk(x, keyVars=y1cn, w=weightcn)$global_risk_pct
    repObj <- set.reportObj(repObj, "indivRisk.unmodified", list(round(ro, 4)))
    
    # 10 combinations with highest risks
    or <- cbind(y1, risk$individual)
    index <- apply(y1, 1, paste, collapse="")
    or <- or[!duplicated(index),]
    or <- or[order(or$risk,decreasing = TRUE),]
    repObj <- set.reportObj(repObj, "indivRisk.highest", list(or[1:10,]))
  }
  
  ## information about hierarchical risk
  if ( !"hier_risk_ER" %in% names(obj@risk$global) ) {
    repObj <- set.reportObj(repObj, "hierRisk.show", list(FALSE))
  }
  
  if ( get.reportObj(repObj, "hierRisk.show") ) {
    if ( is.na(obj@risk$global$hier_risk_ER) ) {
      repObj <- set.reportObj(repObj, "hierRisk.show", list(FALSE))
    }      
  }
  
  if ( get.reportObj(repObj, "hierRisk.show") ) {
    repObj <- set.reportObj(repObj, "hierRisk.expReindent", list(round(obj@risk$global$hier_risk_ER,2)))
    repObj <- set.reportObj(repObj, "hierRisk.expReindent.perc", list(round(obj@risk$global$hier_risk_pct,2)))
    repObj <- set.reportObj(repObj, "hierRisk.expReindentOrig", list(round(obj@originalRisk$global$hier_risk_ER,2)))
    repObj <- set.reportObj(repObj, "hierRisk.expReindentOrig.perc", list(round(obj@originalRisk$global$hier_risk_pct,2)))
  }
  
  ## information about disclosure risk on continuous key variables
  risknum <- get.sdcMicroObj(obj, "risk")$numeric
  if ( is.null(is.null(get.sdcMicroObj(obj, "manipNumVars"))) ) {
    repObj <- set.reportObj(repObj, "riskNumKeyVars.show", list(FALSE))
  } else {
    repObj <- set.reportObj(repObj, "riskNumKeyVars.risk", list(round(100*obj@risk$numeric,2)))
  }
  
  ## information about data-utility
  if ( get.reportObj(repObj, "dataUtility.show") ) {
    ind <- 1
    dataUtility <- list()
    for ( i in y1cn ) {
      dataUtility[[i]] <- list()
      maxcols <- length(unique(x[,i])) #max(apply(x[, y1cn], 2, function(x) length(unique(x))))
      df <- data.frame(matrix(, ncol=maxcols, nrow=4))#length(y1cn)))
      colnames(df) <- paste(1:maxcols)
      df[1,] <- levels(factor(x[,i]))
      df[2,] <- table(factor(x[,i]))
      df[4,] <- extend(table(factor(y1[,ind])), maxcols)
      df[3,] <- extend(levels(factor(y1[,ind])), maxcols)
      rownames(df) <- c("categories1","orig","categories2","recoded")
      ww <- which(colnames(x) %in% i)
      
      dataUtility[[i]]$title <- colnames(x)[ww]
      dataUtility[[i]]$tab <- df
      ind <- ind +1
    }
    repObj <- set.reportObj(repObj, "dataUtility.info", list(dataUtility))
  }
  
  ## Local Suppressions
  if ( get.reportObj(repObj, "localSupps.show") ) {
    locsupps <- as.numeric(unlist(get.sdcMicroObj(obj, "localSuppression")))
    if( length(locsupps) == 0) { 
      locsupps <- rep(0,length(y1cn))
    }
    df <- data.frame(matrix(,ncol=length(y1cn), nrow=2))
    colnames(df) <- y1cn
    rownames(df) <- c("absolute","relative (in percent)")
    df[1,] <- paste(as.integer(locsupps))
    df[2,] <- round(locsupps/nrow(x)*100,2)
    repObj <- set.reportObj(repObj, "localSupps.tab", list(df))
  }
  
  ## information about data-utility for continous variables
  # nothing to show
  if (  ncol(y2) == 0 ) {
    repObj <- set.reportObj(repObj, "dataUtilityCont.show", list(FALSE))
  }
  
  if ( get.reportObj(repObj, "dataUtilityCont.show") ) {
    s <- apply(x[,y2cn], 2, summary, na.rm=TRUE) 
    ss <- apply(y2, 2, function(x) round(summary(x, na.rm=TRUE),1)) 
    colnames(ss) <- paste(colnames(ss),".m", sep="")
    pNum <- length(get.sdcMicroObj(obj, "numVars"))
    xx <- cbind(s,ss)
    if ( pNum > 1 ) {
      SEQ <- SEQinit <- c(1,pNum+1)
      for(i in 1:(pNum-1)){
        SEQ <- c(SEQ, SEQinit+i)
      }
    }
    repObj <- set.reportObj(repObj, "dataUtilityCont.tabSummary", list(as.data.frame(xx[, SEQ])))
    repObj <- set.reportObj(repObj, "dataUtilityCont.IL1", list(round(obj@utility$il1,2)))
    repObj <- set.reportObj(repObj, "dataUtilityCont.diffEigen", list(round(obj@utility$eigen*100,2)))
    
    ### boxplot of differences
    mi <- min(x[,y2cn],y2)
    ma <- max(x[,y2cn],y2)
    fn <- paste("Graph-",format(Sys.time(), "%d-%m-%Y-%H%M%S"),".png", sep="")
    png(filename=fn, height=400, width=600)
    b <- boxplot(x[,y2cn], boxwex=0.1, main="univariate comparison original vs. perturbed data", ylim=c(mi,ma))
    boxplot(y2, add=TRUE, at=1:ncol(y2)+0.2, boxwex=0.1, col="lightgrey", xaxt="n", xlab="")	
    legend("topright", legend=c("orig","pert"), pch=15, col=c("white","lightgrey"))	
    legend("topright", legend=c("orig","pert"), pch=22)
    dev.off()
    repObj <- set.reportObj(repObj, "dataUtilityCont.plotName", list(fn))
  }
  
  ## R-code
  if ( "cmd" %in% names(optionss) ) {
    repObj <- set.reportObj(repObj, "code", list(obj@options$cmd))
  }
  
  ## information about current R-session
  if ( get.reportObj(repObj, "sessionInfo.show") ) {
    repObj <- set.reportObj(repObj, "sessionInfo.info", list(unclass(sessionInfo())))
  }
  
  return(repObj)
})

setGeneric('report', 
  function(obj,outdir=getwd(),filename="SDC-Report",format="HTML",title='SDC-Report',internal=FALSE) {
    standardGeneric('report')
  }
)

setMethod(f='report', signature=c('sdcMicroObj'), 
  definition=function(obj, outdir=getwd(),filename="SDC-Report",format="HTML",title='SDC-Report',internal=FALSE) {
    if ( !format %in% c("HTML","LATEX","TEXT") ) {
      stop("possible values for 'type' are 'HTML','LATEX' and 'TEXT'!\n")
    }      
    
    repObj <- calcReportData(obj, internal=internal, title=title)
    
    oldwd <- getwd()
    setwd(outdir)   
    
    if ( format == "HTML" ) {
      # markdown --> html
      css <- system.file("templates", "report.css", package="sdcMicro")
      tpl <- system.file("templates", "template-report-html.brew", package="sdcMicro")
      
      mdOut <- "reportTemplate.md"
      
      brew(file=tpl, output=mdOut)
      knit2html(stylesheet=css, input=mdOut, quiet=TRUE) 
      file.remove(mdOut)
      #xx <- file.rename("reportTemplate-out.html", paste(filename,".html", sep=""))
      xx <- file.rename("reportTemplate.html", filename)
      xx <- file.remove("reportTemplate.txt")
      setwd(oldwd)
    }
    
    if ( format == "LATEX" ) {
      tpl <- system.file("templates", "template-report-latex.brew", package="sdcMicro")
      brew(file=tpl, output=filename)
      
      # replace special chars
      xx <- readLines(filename)
      for ( k in 1:length(xx) ) {
        xx[k] <- gsub("_","\\_", xx[k], fixed=TRUE)
      }
      cat(xx, file=filename, sep="\n")
      texi2pdf(filename, clean=TRUE)
    }
    
    if ( format == "TEXT" ) {
      tpl <- system.file("templates", "template-report-text.brew", package="sdcMicro")
      brew(file=tpl, output=filename)
    }

    setwd(oldwd)
  }
)