class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_item(item)
    end
  end

  def increment_quality item
    item.quality += 1 if item.quality < 50
  end

  def decrement_quality item
    item.quality -= 1 if item.quality > 0
  end

  def update_item item
    return if item.name == "Sulfuras, Hand of Ragnaros"
    
    item.sell_in = item.sell_in - 1

    if item.name == "Aged Brie"
      increment_quality(item)
      if item.sell_in < 0
        increment_quality(item)
      end
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      if item.sell_in < 11
        increment_quality(item)
      end
      if item.sell_in < 6
        increment_quality(item)
      end
      if item.sell_in < 0
        item.quality -= quality
      end
    elsif item.name == "Conjured"
      decrease_quality(item)
      decrease_quality(item)
      if item.sell_in < 0
       decrease_quality(item)
       decrease_quality(item)
      end
    else
      decrement_quality(item)
      if item.sell_in < 0
        decrement_quality(item)
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
