# These are helper functions for R and the DEA
#    book.

## ---- poscolfunct ----
# Accepts a dataframe and returns only columns that do not sum to zero.

#' Filters Out Zero Columns
#'
#' @param df matrix
#' @param cutoff Cutoff value for passing columns
#'
#' @return df matrix w/o all zero columns
#' @export
#'
#' @examples
#' poscol(matrix(c(1,2,0,0,5,0),ncol=3)) # Filters 0, 0 column
#' poscol(matrix(c(1,2,0,0.000001,5,0),ncol=3),cutoff=0) # Filters 0, small column
#' poscol(matrix(c(1,2,0,0.000001,5,0),ncol=3),cutoff=0.00001) # Filters 0, small column
#' poscol(matrix(c(1,2,0,-0.000001,5,0),ncol=3)) # Filters 0, small negative column
poscol<-function(df, cutoff=0) {
  positive.columns <- df[, colSums(df) >= cutoff]
  return (positive.columns)
}

## ---- DEAnamesfunction ----
# Generates a generic set of names for all objects that might be used by DEA.

#' Generates Generic Names for DEA
#'
#' @param NX Number of inputs
#' @param NY Number of outputs
#' @param ND Number of decision making units
#'
#' @return
#' @export
#'
#' @examples
#' DEAnames (1,2,3) # 1-input, 2-output, 3 DMUs
#' names <- DEAnames(1,2,3)
#' lambda <- matrix(rep(-1.0, 3^2), nrow=3)
#' lambda
#' dimnames (lambda) <- c(list(names$DMUnamesbyletter),
#'                        list(names$Lambdanamesbyletter))
#' lambda
#' dimnames (lambda) <- c(list(names$DMUnamesbynumber),
#'                        list(names$LambdanamesbynumberLX))
#' lambda   # Ready to be rendered using LaTeX
DEAnames<-function(NX, NY, ND) {

  DMUnamesbyletter <- list(c(LETTERS[1:ND]))[[1]]          # DMU names: A, B, ...
  DMUnamesbynumber <- lapply(list(rep("DMU ",ND)),paste0,1:ND) [[1]]
        # DMU names: DMU 1, DMU 2, DMU 3 ...

  # These are plain text names

  Xnames   <- lapply(list(rep("X",NX)),paste0,1:NX) [[1]]  # Input names: x1, ...
  Ynames   <- lapply(list(rep("Y",NY)),paste0,1:NY) [[1]]  # Output names: y1, ...
  Vnames   <- lapply(list(rep("v",NX)),paste0,1:NX) [[1]]  # Input weight names: v1, ...
  Unames   <- lapply(list(rep("u",NY)),paste0,1:NY) [[1]]  # Output weight names: u1, ...
  SXnames  <- lapply(list(rep("sx",NX)),paste0,1:NX) [[1]] # Input slack names: sx1, ...
  SYnames  <- lapply(list(rep("sy",NY)),paste0,1:NY) [[1]] # Output slack names: sy1, ...
  Lambdanamesbyletter <- lapply(list(rep("L_",ND)),paste0,LETTERS[1:ND])[[1]]
  Lambdanamesbynumber <- lapply(list(rep("L_",ND)),paste0,1:ND)[[1]]

  # These are names using LaTeX

  XnamesLX      <- lapply(list(rep("$X_{",NX)),       paste0,  1:NX,rep("}$",NX)) [[1]]
                           # Input names: x1, ...
  YnamesLX      <- lapply(list(rep("$Y_{",NY)),       paste0,  1:NY,rep("}$",NY)) [[1]]
  VnamesLX      <- lapply(list(rep("$v_{",NX)),       paste0,  1:NX,rep("}$",NX)) [[1]] # Input weight names: v1, ...
  UnamesLX      <- lapply(list(rep("$u_{",NY)),paste0,1:NY,rep("}$",NY))  [[1]] # Output weight names: u1, ...
  SXnamesLX     <- lapply(list(rep("$s^{x}_{",NX)),   paste0,  1:NX,rep("}$",NX)) [[1]] # Input slack names: sx1, ...
  SYnamesLX     <- lapply(list(rep("$s^{y}_{",NY)),   paste0,  1:NY,rep("}$",NY)) [[1]] # Output slack names: sy1, ...
  LambdanamesbyletterLX <- lapply(list(rep("$\\lambda_{",ND)), paste0,  LETTERS[1:ND], rep("}$",ND)) [[1]]
  LambdanamesbynumberLX <- lapply(list(rep("$\\lambda_{",ND)), paste0,  1:ND, rep("}$",ND)) [[1]]


  allnames<-list(DMUnamesbyletter=DMUnamesbyletter,
                 DMUnamesbynumber=DMUnamesbynumber,
                 Xnames=Xnames,
                 Ynames=Ynames,
                 Vnames=Vnames,
                 Unames=Unames,
                 SXnames=SXnames,
                 SYnames=SYnames,
                 Lambdanamesbyletter=Lambdanamesbyletter,
                 Lambdanamesbynumber=Lambdanamesbynumber,
                 XnamesLX=XnamesLX,
                 YnamesLX=YnamesLX,
                 VnamesLX=VnamesLX,
                 UnamesLX=UnamesLX,
                 SXnamesLX=SXnamesLX,
                 SYnamesLX=SYnamesLX,
                 LambdanamesbyletterLX=LambdanamesbyletterLX,
                 LambdanamesbynumberLX=LambdanamesbynumberLX)

  return(allnames)
}

## ---- DrawIOdiagramfunction ----
# Accepts a list of inputs, outputs, and model description
#    Draws an input-output diagram

#' Draw DEA Input-Output Diagram
#'
#' @param Xnames   Names of Inputs
#' @param Ynames   Names of Outputs
#' @param Modeldescrip  Model Description
#'
#' @return Input-Output Diagram as PNG
#' @export
#'
#' @examples
#' DrawIOdiagram (c("X1 (FTE)" ), c("Y1 ($M)"), '"\nBCC-IO\n "')
DrawIOdiagram<-function(Xnames="1",Ynames="1", Modeldescrip="DEA") {


  a <- "'"

  NX <- lengths(Xnames)     # Number of inputs
  NY <- lengths(Ynames)     # Number of outputs

  Xlabels <- c(mapply(paste0, a, Xnames, a)) # Surround text with '

  Ylabels <- c(mapply(paste0, a, Ynames, a))

  nboxpad <- max(floor(1+NX/2), floor(1+NY/2)) # Pad height of model box

  boxpadding <- paste(rep("\n",nboxpad),collapse='')
  # Build line returns

  Modellabel <- paste(boxpadding, Modeldescrip, boxpadding,
                      collapse="")
  # Want to vertically pad returns, \n's top and bottom to
  #    balance the height of the boxspace figure

  # Define the nodes for the inputs and outputs
  nodelabels <- paste(c(Xlabels,Ylabels), collapse="; ")

  # Define the edges (arrows) for inputs and outputs
  Xedges <- paste(c(mapply(paste0, Xlabels,"->", Modellabel [1], " " )),collapse="")
  Yedges <- paste(c(mapply(paste, Modellabel [1], "->", Ylabels," "  )),collapse="")
  # Note:  I'm sure the above two lines are pretty inefficient but they work!

  # Combine edges for inputs and outputs
  edges <- paste0(
    Xedges, Yedges    # All edges or arrows are for inputs or outputs
  )

  ##  Plot graph:
  IOGraph <- DiagrammeR::grViz(
    paste0(" digraph Input_Output_Diagram {

    # a 'graph' statement
    graph [overlap = false, # True or false both work fine
           fontsize = 10,
           rankdir = LR,    # Left to right structure
           layout = dot]    # dot layout is best for this,
                            # neato, twopi, circo are not suitable

    # several 'node' statements
    node [shape = plaintext,  # Avoids any outline or shape
    fontname = Helvetica]
    ", nodelabels, "

    node [shape = box, style=filled, color=lightgrey,
    fontname = Helvetica]
    ", Modellabel, "

    # several 'edge' statements
    ", edges, "
    }"
    )
  )

  return (IOGraph)
}
