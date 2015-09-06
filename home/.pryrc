# -*-ruby-*-
if defined? Rails
  include FactoryGirl::Syntax::Methods if defined? FactoryGirl
  def rl!
    reload!
    FactoryGirl.reload if defined? FactoryGirl
    puts "Reloaded."
    true
  end
end
