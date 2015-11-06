class EmailProviderFake
  def initialize(subjects)
    @subjects = subjects
  end

  def get_subjects
    ["urgente",
     "no tan urgente que lo anterior",
     "preocupante",
     "Hay que revisar los callbacks"]
  end
end
