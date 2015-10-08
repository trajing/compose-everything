# Top-level module
module ComposeEverything
  # All the refinements to add FunctionalGoodies to built-ins
  
  # Adds to Hash
  module HashRefine
    refine Hash do
      include ComposeEverything::FunctionalGoodies
    end
  end

  # Adds to Array
  module ArrayRefine
    refine Array do
      include ComposeEverything::FunctionalGoodies
    end
  end

  # Adds to Proc
  module ProcRefine
    refine Proc do
      include ComposeEverything::FunctionalGoodies
    end
  end

  # Adds to thread
  module ThreadRefine
    refine Thread do
      include ComposeEverything::FunctionalGoodies
    end
  end
  
  # All the refinements for this gem
  module Refinements
    include HashRefine
    include ThreadRefine
    include ProcRefine
    include ArrayRefine
  end
end
