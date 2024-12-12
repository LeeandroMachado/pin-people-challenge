class Container
  extend Dry::Container::Mixin
end

Import = Dry::AutoInject(Container)
