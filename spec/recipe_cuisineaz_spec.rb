require 'spec_helper'

describe "http://www.cuisineaz.com recipe crawler" do

  before(:each) do
    marmiton_url = 'http://www.cuisineaz.com/recettes/concombre-a-la-creme-fraiche-et-a-la-ciboulette-56227.aspx'
    @recipe = RecipeCrawler::Recipe.new marmiton_url
  end


  it 'should instanciante a recipe' do
    expect(@recipe).not_to be nil
  end



  it 'should get the right title' do
    expect(@recipe.title).to eq("Concombre à la crème fraîche et à la ciboulette")
  end


  it 'should get the right times' do
    expect(@recipe.preptime).to eq(15)
    expect(@recipe.cooktime).to eq(0)
  end


  it 'should get ingredients' do
    array_exepted = ["2 concombres", "1 pot de crème fraîche épaisse", "1 botte de ciboulette fraîche", "le jus d'un citron non traité", "sel, poivre au goût"]
    expect(@recipe.ingredients).to be_kind_of(Array)
    expect(@recipe.ingredients).to eq array_exepted
  end


  it 'should get steps' do
    expect(@recipe.steps).to be_kind_of(Array)
    expect(@recipe.steps.include?('Nettoyez et coupez les concombres en fines rondelles'))
  end


  it 'should get picture' do
    expect(@recipe.image).to eq src="http://91.68.209.9/bmi/images.cuisineaz.com/240x192/17577995-325c-4390-8647-83605b9089a8_concombre-a-la-creme-fraiche-et-a-la-ciboulette-56227.jpg"
  end



end