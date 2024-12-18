class BuildService
  def call(row, caches)
    @row = row
    @caches = caches

    build
  end

  protected

  attr_accessor :row, :caches

  def cache_and_find(cache_key, key, model)
    caches[cache_key][key] ||= model.find_or_create_by(name: key)
  end
end
