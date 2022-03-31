class GildedRose
  attr_reader :name, :days_remaining, :quality, :type

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
    case @name
    when "Aged Brie"
      @type = :aged
    when "Backstage passes to a TAFKAL80ETC concert"
      @type = :backstage
    when "Legendary Sulfuras, Hand of Ragnaros"
      @type = :legendary
    end
  end

  def tick
    case @type
    when :aged
      tick_aged
    when :legendary
      tick_legendary
    when :backstage
      tick_backstage
    else
      tick_normal
    end

  end

  def tick_aged
    if @quality < 50
      @quality += 1
    end

    @days_remaining -= 1

    if @days_remaining < 0 && @quality < 50
      @quality += 1
    end
    
  end

  def tick_legendary
    # Future Legendary tick
  end

  def tick_backstage

    if @quality < 50
      @quality += 1 
    end


    if @days_remaining < 11
      if @quality < 50
        @quality += 1 
      end
    end

    if @days_remaining < 6
      if @quality < 50
        @quality += 1 
      end
    end

    @days_remaining -= 1

    if @days_remaining < 0
      @quality = 0
    end


  end

  def tick_normal
    if @quality > 0
      @quality -= 1 
    end

    @days_remaining -= 1 

    if @days_remaining < 0
      if @quality > 0
        @quality -= 1 
      end
    end


  end

end

