module ols

export tols, summary

# Author: Adam Savitzky
# Email: asavitzky@forio.com
# Github: github.com/adambom

# Ported from the Python implemented by Vincent Nijs
# http://www.scipy.org/Cookbook/OLS?action=AttachFile&do=get&target=ols.0.2.py

# Julia type for multiple (multivariate) regression using OLS
# For least squared regression on linear equations of multiple independent variables
# y = a1 * x1 + a2 * x2 + ... an * xn
# Y = AX + E

# Input
## y = dependent variable
## y_varnm = string with the variable label for y
## x = independent variables, note that a constant is added by default
## x_varnm = list of variable labels for the independent variables

# Usage
## Instantiate a new ols type
### reg = ols(y, x, "y", ["x1", "x2", "x3"])
### Coefficients: reg.b
### R-Squared: reg.R2
### F-Statistic: reg.F
### Summary: summary(reg)

type tols
    y::Array{Float64}
    x::Array{Float64}
    y_varnm::String
    x_varnm::Array{String, 1}
    inv_xx::Array{Float64}
    b::Array{Float64, 1}
    nobs::Int
    ncoef::Int
    df_e::Int
    df_r::Int
    er::Array
    sse::Float64
    se::Array{Float64, 1}
    t::Array{Float64}
    #p::Array
    R2::Float64
    R2adj::Float64
    F::Float64
    #Fpv::Float64
    
    function tols(y, x, y_varnm, x_varnm)
        x = hcat(ones(size(x, 1)), x)
        xT = transpose(x)

        inv_xx = inv(xT * x)
        xy = xT * y
        b = inv_xx * xy           # estimate coefficients

        nobs = size(y, 1)         # number of observations
        ncoef = size(x, 2)        # number of coefficients
        df_e = nobs - ncoef       # degrees of freedom, error 
        df_r = ncoef - 1          # degrees of freedom, regression

        er = y - x * b            # residuals
        sse = e^2/df_e            # SSE
        se = sqrt(diag(sse * inv_xx)) # coef. standard errors
        t = b / se                # coef. t-statistics
        # p = (1 - cdf(abs(t), df_e)) * 2 # coef. p-values

        R2 = 1 - var(er) / var(y) # model R-squared
        R2adj = 1 - (1 - R2) * ((nobs - 1) / (nobs - ncoef)) # adjusted R-square

        F = (R2 / df_r) / ((1 - R2) / df_e) # model F-statistic
        # Fpv = 1 - cdf(F, df_r, df_e) # F-statistic p-value

        new(y, x, y_varnm, x_varnm, inv_xx, b, nobs, ncoef, df_e, df_r, er, sse, se, t, R2, R2adj, F)
    end
end

function dw(self::tols)
    # Calculates the Durbin-Waston statistic
    de = self.er - 1.
    result = dot(de, de) / dot(self.er, self.er)
    return result
end

function ll(self::tols)
    # Calculate model log-likelihood and two information criteria
        
    # Model log-likelihood, AIC, and BIC criterion values 
    loglike = -(self.nobs / 2) * (1 + log(2pi)) - (self.nobs / 2) * log(dot(self.er, self.er) / self.nobs)
    aic = -2loglike / self.nobs + (2 * self.ncoef / self.nobs)
    bic = -2loglike / self.nobs + (self.ncoef * log(self.nobs)) / self.nobs

    return loglike, aic, bic
end

function summary(self::tols)
    # print model output to screen

    t = time()

    # extra stats
    loglike, aic, bic = ll(self)
    #JB, JBpv, skew, kurtosis = self.JB()
    #omni, omnipv = self.omni()

    println("==============================================================================")
    #println("Dependent Variable: " + self.y_varnm)
    println("Method: Least Squares")
    println("Time: $t")
    println("No. obs:               $(self.nobs)")
    println("No. variables:         $(self.ncoef)")
    println("==============================================================================")
    println("variable             coefficient             std. Error              t-statistic")
    println("==============================================================================")
    for i in 1:length(self.x_varnm)
        println("$(self.x_varnm[i])         $(self.b[i])        $(self.se[i])        $(self.t[i])")
    end
    println("========================================================================================")
    println("Model Stats                                    Residual Stats")
    println("========================================================================================")
    println("R-Squared            $(self.R2)        Durbin-Watson Stat: $(dw(self))")
    println("Adjusted R-Squared   $(self.R2adj)        Omnimbus Stat:      ?")
    println("F-Statistic          $(self.F)        Prob(Omnibus stat): ?")
    println("Log-Likelihood       $loglike       Prob(JB):           ?")
    println("AIC Criterion        $aic        Skew:               ?")
    println("BIC Criterion        $bic         Kurtosis:           ?")
    println("========================================================================================")
end

function linreg{T<:Number}(X::StridedVecOrMat{T}, y::Vector{T})
    hcat(ones(T, size(X,1)), X)\y
end

end
