require_relative "./datasets_container"

class Container
  extend Dry::Container::Mixin

  merge(DatasetsContainer)
end

Import = Dry::AutoInject(Container)
