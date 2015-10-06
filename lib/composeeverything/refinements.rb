# Refinement to add the FunctionalGoodies module to Hash
module ComposeEverything::Hash
  refine Hash do
    include ComposeEverything::FunctionalGoodies
  end
end

# Refinement to add the FunctionalGoodies module to Array
module ComposeEverything::Array
  refine Array do
    include ComposeEverything::FunctionalGoodies
  end
end

# Refinement to add the FunctionalGoodies module to Proc
module ComposeEverything::Proc
  refine Proc do
    include ComposeEverything::FunctionalGoodies
  end
end

# Refinement to add the FunctionalGoodies module to Thread
module ComposeEverything::Thread
  refine Thread do
    include ComposeEverything::FunctionalGoodies
  end
end
