class Profile < ApplicationRecord

  enum :role, {
    frontend: 1,
    backend: 2,
    fullstack: 3,
    mobile: 4,
    designer: 5,
    qa: 6
  }
end
