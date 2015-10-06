# Refinements to add the FunctionalGoodies module to built-ins
module ComposeEverything::Refinements
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

  include HashRefine
  include ThreadRefine
  include ProcRefine
  include ArrayRefine
end
