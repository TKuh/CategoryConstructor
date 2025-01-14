# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Declarations
#

#! @Chapter Futher CAP operations

DeclareGlobalVariable( "CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD" );

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_CATEGORY_CONSTRUCTOR" );

DeclareGlobalFunction( "RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION" );

DeclareGlobalFunction( "UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION" );

###################################
##
#! @Section PreInverse and PostInverse
##
###################################

#! @Description
#!  The argument is a morphism $\alpha: A \rightarrow B$.
#!  The output is the preinverse $\iota: B \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}(B,A)$
#! @Arguments alpha
#! @Returns a morphism
DeclareOperation( "PostInverse",
        [ IsCapCategoryMorphism ] );

#! @Description
#!  The argument is a morphism $\alpha: A \rightarrow B$.
#!  The output is the postinverse $\iota: B \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}(B,A)$
#! @Arguments alpha
#! @Returns a morphism
DeclareOperation( "PreInverse",
        [ IsCapCategoryMorphism ] );

###################################
##
#! @Section IsWeakTerminal and IsWeakInitial
##
###################################

#! @Description
#! The argument is an object $a$ of a category $\mathbf{C}$.
#! The output is <C>true</C> if $a$ is weak terminal $\mathbf{C}$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments a
DeclareProperty( "IsWeakTerminal",
                 IsCapCategoryObject );

#! @Description
#! The argument is an object $a$ of a category $\mathbf{C}$.
#! The output is <C>true</C> if $a$ is weak initial in $\mathbf{C}$,
#! otherwise the output is <C>false</C>.
#! @Returns a boolean
#! @Arguments a
DeclareProperty( "IsWeakInitial",
                 IsCapCategoryObject );

###################################
##
#! @Section RelativeLift/RelativeColift
##
###################################

#! @Description
#! The arguments are two morphisms $\beta: b \rightarrow c$, $\alpha: a \rightarrow c$, and $\nu: d \rightarrow c$ .
#! The output is a relative lift $\beta / \alpha: b \rightarrow a$ of $\beta$ along $\alpha$ modulo $\nu$.
#! if such a relative lift exists or $\mathtt{fail}$ if it doesn't.
#! Recall that a relative lift $\beta / \alpha: b \rightarrow a$ of $\beta$ along $\alpha$ modulo $\nu$ is
#! a morphism such that $\alpha \circ (\beta / \alpha) \sim_{b,c} \beta + \chi \nu$, for some morphism $\chi: b \rightarrow d$.
#! @Returns a morphism in $\mathrm{Hom}(b,a) + \{ \mathtt{fail} \}$
#! @Arguments beta, alpha, nu
DeclareOperation( "RelativeLift",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

####################################
##
#! @Section Biased relative weak fiber product
##
####################################

#! For a given pair of morphisms $(\alpha: A \rightarrow B, \beta \colon C \rightarrow B)$, a biased relative weak fiber product of $(\alpha, \beta)$ consists of three parts:
#! * an object $P$,
#! * a morphism $\pi: P \rightarrow A$ such that there exists a morphism $\delta: P \rightarrow C$ such that $\beta \circ \delta \sim_{P,B} \alpha \circ \pi$,
#! * a dependent function $u$ mapping each $\tau: T \rightarrow A$, which admits a morphism $\mu \colon T \rightarrow C$ with $\beta \circ \mu \sim_{T,B} \alpha \circ \tau$, to a morphism $u(\tau):T \rightarrow P$ such that $\pi \circ u(\tau) \sim_{T,A} \tau$.
#! The triple $( P, \pi, u )$ is called a <Emph>biased relative weak fiber product</Emph> of $(\alpha,\beta)$.
#! We denote the object $P$ of such a triple by $\mathrm{BiasedRelativeWeakFiberProduct}(\alpha,\beta)$.
#! We say that the morphism $u(\tau)$ is induced by the
#! <Emph>universal property of the biased relative weak fiber product</Emph>.

#! @BeginLatexOnly
#! \begin{center}
#! \begin{tikzpicture}
#! \def\w{2};
#! \node (A) at (0,0) {$A$};
#! \node (B) at (\w,0) {$B$};
#! \node (C) at (\w,\w) {$C$};
#! \node (P) at (0,\w) {$P$};
#! \node (T) at (-\w,2*\w) {$T$};
#! \draw[-latex] (A) to node[pos=0.45, above] {$\alpha$} (B);
#! \draw[-latex] (C) to node[pos=0.45, right] {$\beta$} (B);
#! \draw[-latex] (P) to node[pos=0.45, left] {$\pi$} (A);
#! \draw[-latex] (T) to [out = -90, in = 180] node[pos=0.45, left] {$\tau$} (A);
#! \draw[-latex] (T) to node[pos=0.45, above right] {$\exists u( \tau )$} (P);
#! \draw[-latex, dotted] (P) to node[pos=0.45, above] {$\delta$} (C);
#! \draw[-latex, dotted] (T) to [out = 0, in = 90] node[pos=0.45, above] {$\mu$} (C);
#! \end{tikzpicture}
#! \end{center}
#! @EndLatexOnly


## Main Operations and Attributes

#! @Description
#! The arguments are two morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$.
#! The output is the biased relative weak fiber product $P$ of $\alpha$ and $\beta$.
#! @Returns an object
#! @Arguments alpha, beta, sigma
DeclareOperation( "BiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

## corresponds to projection in 1st factor
#! @Description
#! The arguments are three morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$, $\sigma: D \rightarrow A$.
#! The output is the biased relative weak fiber product projection $\pi: P \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}( P, A )$
#! @Arguments alpha, beta, sigma
DeclareOperation( "ProjectionOfBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#! The arguments are two morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$, $\sigma: D \rightarrow A$,
#! and an object $P = \mathrm{BiasedRelativeWeakFiberProduct}( \alpha, \beta )$.
#! The output is the biased relative weak fiber product projection $\pi: P \rightarrow A$.
#! @Returns a morphism in $\mathrm{Hom}( P, A )$
#! @Arguments alpha, beta, sigma, P
DeclareOperation( "ProjectionOfBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

#! @Description
#! The arguments are three morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$, $\sigma: D \rightarrow A$,
#! $\tau: T \rightarrow A$.
#! The output is the morphism $u( \tau )$ induced by the universal property of the biased relative weak fiber product
#! $P$ of $\alpha$ and $\beta$.
#! @Returns a morphism in $\mathrm{Hom}( T, P )$
#! @Arguments alpha, beta, sigma, tau
DeclareOperation( "UniversalMorphismIntoBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );

#! @Description
#! The arguments are three morphisms $\alpha: A \rightarrow B$, $\beta: C \rightarrow B$,
#! $\tau: T \rightarrow A$
#! and an object $P = \mathrm{BiasedRelativeWeakFiberProduct}( \alpha, \beta )$.
#! The output is the morphism $u( \tau )$ induced by the universal property of the biased relative weak fiber product
#! $P$ of $\alpha$ and $\beta$.
#! @Returns a morphism in $\mathrm{Hom}( T, P )$
#! @Arguments alpha, beta, sigma, tau, P
DeclareOperation( "UniversalMorphismIntoBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct",
                  [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ] );

###################################
##
#! @Section EmbeddingOfSumOfImagesOfAllMorphisms
##
###################################

#! @Description
#!  Return a morphism onto the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "MorphismOntoSumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  Return the embedding of the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "EmbeddingOfSumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

#! @Description
#!  Return the sum of images of all morphisms between <A>a</A> and <A>b</A>.
#! @Arguments a, b
#! @Returns a morphism
DeclareOperation( "SumOfImagesOfAllMorphisms",
        [ IsCapCategoryObject, IsCapCategoryObject ] );

###################################
##
#! @Section Systems of homogeneous linear equations in linear categories
##
###################################

#! @Description
#! Like <C>SolveLinearSystemInAbCategory</C>,
#! but the output is simply <C>true</C> if a unique solution exists,
#! and <C>false</C> otherwise.
#! @Returns a boolean
#! @Arguments left_coeffs, right_coeffs, right_side
DeclareOperation( "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                   [ IsList, IsList, IsList ] );

##
DeclareOperation( "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                   [ IsCapCategory, IsList, IsList ] );

#! @Description
#! but the output is <C>true</C> if the homogeneous system has only the trivial solution,
#! and <C>false</C> otherwise.
#! @Returns a boolean
#! @Arguments left_coeffs, right_coeffs
DeclareOperation( "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                   [ IsList, IsList ] );

##
DeclareOperation( "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                   [ IsCapCategory, IsList, IsList ] );

#! @Description
#! The arguments are two lists of lists $\alpha$ and $\beta$ of morphisms in some linear category over commutative ring.
#! The first list $\alpha$ (the left coefficients) is a list of list of morphisms $\alpha_{ij}: A_i \rightarrow B_j$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$ for integers $m,n \geq 1$.
#! The second list $\beta$ (the right coefficients) is a list of list of morphisms $\beta_{ij}: C_j \rightarrow D_i$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$.
#! The output is either
#! a generating set $[X^1,\dots,X^t]$ for the solutions of the homogeneous linear system
#! defined by $\alpha$, $\beta$, i.e.,
#! $\sum_{j = 1}^n \alpha_{ij}\cdot X^{k}_{j} \cdot \beta_{ij} = 0$
#! for all $i = 1 \dots m$ and all $k = 1 \dots t$
#! or $\texttt{fail}$ if no such solution exists.
#! @Returns a list of lists of morphisms $[X^1, \dots, X^t]$
#! @Arguments alpha, beta
DeclareOperation( "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                   [ IsList, IsList ] );

##
DeclareOperation( "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                   [ IsCapCategory, IsList, IsList, IsList, IsList ] );

#! @Description
#! The arguments are four lists of lists $\alpha$, $\beta$, $\gamma$, $\delta$ of morphisms in some linear category over commutative ring.
#! Each of $\alpha$ and $\gamma$ is a list of list of morphisms $\alpha_{ij}, \gamma_{ij}: A_i \rightarrow B_j$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$ for integers $m,n \geq 1$.
#! Each of $\beta$ and $\delta$ is also a list of list of morphisms $\beta_{ij}, \delta_{ij}: C_j \rightarrow D_i$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$.
#! The output is either
#! a generating set $[X^1,\dots,X^t]$ for the solutions of the homogeneous linear system
#! defined by $\alpha$, $\beta$, $\gamma$ and $\delta$, i.e.,
#! $\sum_{j = 1}^n \alpha_{ij}\cdot X^{k}_{j} \cdot \beta_{ij} = \sum_{j = 1}^n \gamma_{ij}\cdot X^{k}_{j} \cdot \delta_{ij}$
#! for all $i = 1 \dots m$ and all $k = 1 \dots t$
#! or $\texttt{fail}$ if no such solution exists.
#! @Returns a list of lists of morphisms $[X^1, \dots, X^t]$
#! @Arguments alpha, beta, gamma, delta
DeclareOperation( "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                   [ IsList, IsList, IsList, IsList] );

#! @Description
#! The arguments are two lists of lists $\alpha$, $\delta$ morphisms in some linear category
#! over commutative ring.
#! $\alpha$ is a list of list of morphisms $\alpha_{ij}:A_i \rightarrow B_j$ and
#! $\delta$ is a list of list of morphisms $\delta_{ij}:C_j \rightarrow D_i$,
#! where $i = 1 \dots m$ and $j = 1 \dots n$ for integers $m,n \geq 1$.
#! The method delegates to <C>BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory</C> applied on
#! $\alpha$, $\beta$, $\gamma$, $\delta$ where $\beta_{ij}$ equals <C>IdentityMorphism</C>(<C>Source</C>($\delta_{ij}$))
#! whenever $\delta_{ij}$ is endomorphism and equals to $0*\delta_{ij}$ otherwise; and
#! $\gamma_{ij}$ equals <C>IdentityMorphism</C>(<C>Source</C>($\alpha_{ij}$))
#! whenever $\alpha_{ij}$ is endomorphism and equals to $0*\alpha_{ij}$ otherwise for all
#! $i = 1 \dots m$ and $j = 1 \dots n$.
#! @Returns a list of lists of morphisms $[X^1, \dots, X^t]$
#! @Arguments alpha, delta
DeclareOperation( "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                   [ IsList, IsList ] );
