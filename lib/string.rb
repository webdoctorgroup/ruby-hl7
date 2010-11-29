class String
  def hl7_batch?
    match(/^FHS/)
  end
end
