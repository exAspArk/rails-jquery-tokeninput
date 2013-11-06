class Country
  class << self
    def all
      [first, last]
    end

    def first
      { name: 'Jamaica', iso_code: 'JM' }
    end

    def last
      { name: 'Hong Kong', iso_code: 'HK' }
    end
  end
end
