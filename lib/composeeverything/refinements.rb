module ComposeEverything::Hash
  refine Hash do
    include ComposeEverything::FunctionalGoodies
  end
end

module ComposeEverything::Array
  refine Array do
    include ComposeEverything::FunctionalGoodies
  end
end

module ComposeEverything::Proc
  refine Proc do
    include ComposeEverything::FunctionalGoodies
  end
end

module ComposeEverything::Thread
  refine Thread do
    include ComposeEverything::FunctionalGoodies
  end
end
