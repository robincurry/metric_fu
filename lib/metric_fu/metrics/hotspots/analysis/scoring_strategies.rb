module MetricFu
  module HotspotScoringStrategies

    def percentile(ranking, item)
      ranking.percentile(item) # per project score percentile
    end

    def identity(ranking, item)
      ranking[item] # Use the score you got (ex flog score of 20 is not bad even if it is the top one in project)
    end

    def present(row)
      1 # If present it's a one, not present it's a zero - For things like Reek that don't have a number
    end

    def sum(scores)
      scores.inject(0) {|s,x| s+x}
    end

    def average(scores)
      # remove dependency on statarray
      # scores.to_statarray.mean
      score_length = scores.length
      total = 0
      total= scores.inject( nil ) { |sum,x| sum ? sum+x : x }
      (total.to_f / score_length.to_f)
    end

    extend self
  end
end
