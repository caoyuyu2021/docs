using PyCall

function anova1(X...)
    #单因素方差分析
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import f_oneway
    def Fitckernel(*args):
        stat, p = f_oneway(*args)
        return stat, p
    """
    return py"Fitckernel"(X...)
end

function anova2(mdl, typ)
    #双向方差分析
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def Anova (mdl,typ):
        aov_table = anova_lm(mdl, typ=typ)
        return aov_table
    """
    return py"Anova"(mdl, typ)
end

function anovan(mdl, typ)
    #N向方差分析
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def Anova(mdl,typ):
        aov_table = anova_lm(mdl, typ=typ)
        return aov_table
    """
    return py"Anova"(mdl, typ)
end

function friedman(X...)
    #弗里德曼试验
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    import scipy.stats as stats
    def Anova(*args):
        res = stats.friedmanchisquare(*args)
        return res
    """
    return py"Anova"(X...)
end

function kruskalwallis(X...)
    #克鲁斯卡尔-瓦利斯试验
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    import scipy.stats as stats
    def Anova(*args):
        res = stats.kruskal(*args)
        return res
    """
    return py"Anova"(X...)
end
