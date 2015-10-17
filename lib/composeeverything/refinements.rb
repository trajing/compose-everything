module ComposeEverything
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

  # Refinements to add the FunctionalGoodies module to built-ins as well as the
  # execution of lambdas with all refinements and addition of refinements
  module Refinements
    include HashRefine
    include ThreadRefine
    include ProcRefine
    include ArrayRefine

    class << self
      attr_reader :refinements
    end

    @refinements = [HashRefine, ThreadRefine, ProcRefine, ArrayRefine]

    def self.add(x)
      @refinements.push x
    end

    def self.remove(x)
      @refinements.delete x
    end

    def self.make(func, this)
      klass = Object.const_set 'MakeClass', Class.new
      klass.class_eval do
        ComposeEverything::Refinements.refinements.each do |refinement|
          using refinement
        end
      end

      lambda do |*params|
        klass.instance_eval func[this, *params]
      end
    end
  end
end
