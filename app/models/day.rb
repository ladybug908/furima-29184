class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '１日〜２日で発送' },
    { id: 3, name: '２日〜３日で発送' },
    { id: 4, name: '３日〜７日で発送' },
  ]
end

