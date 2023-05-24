using HMMBase
using Distributions
using Random

#隐马尔可夫模型最可能状态路径
function hmmviterbi(seq, TRANS, EMIS)
    seq = Array(seq)'
    hmm = HMM(TRANS, EMIS)
    return viterbi(hmm, seq)
end

#基于观测和状态的隐马尔可夫模型参数估计
function hmmestimate(seq, TRANS, EMIS)
    seq = Array(seq)'
    hmm = HMM(TRANS, EMIS)
    hmm, hist = fit_mle(hmm, seq)
    a = hmm.A
    b = [hmm.B[1].p, hmm.B[2].p]
    return a, b
end

#隐马尔可夫模型后验状态概率
function hmmdecode(seq, TRANS, EMIS)
    seq = Array(seq)'
    hmm = HMM(TRANS, EMIS)
    return posteriors(hmm, seq)
end

#基于输出观测概率矩阵的隐马尔可夫模型参数估计
function hmmtrain(seq, TRGUESS, EMITGUESS)
    seq = Array(seq)'
    hmm = HMM(TRGUESS, EMITGUESS)
    hmm, hist = fit_mle(hmm, seq)
    a = hmm.A
    b = [hmm.B[1].p, hmm.B[2].p]
    return a, b
end

#隐马尔可夫模型的状态与观测序列
function hmmgenerate(len, TRANS, EMIS)
    hmm = HMM(TRANS, EMIS)
    seq, states = Random.rand(hmm, len; seq=true)
    return seq, states
end
