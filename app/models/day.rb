class Day < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '１日〜２日で発送' },
    { id: 2, name: '２日〜３日で発送' },
    { id: 3, name: '３日〜７日で発送' }
  ]
end
