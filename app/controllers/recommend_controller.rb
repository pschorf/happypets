class RecommendController < ApplicationController
  def index
    unless current_user
      render_forbidden
      return
    end
    @user_pets = current_user.pets
    @matches = {}
    for pet in @user_pets
      @matches[pet] = get_recommended_pet pet
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pets }
    end
  end
  
  def get_recommended_pet(pet)
    same_genus = Pet.joins(:animal).where('genus = ?', pet.animal.genus)
    different_user = same_genus.where('user_id <> ?', pet.user.id)
    same_gender = different_user.where('gender <> ?', pet.gender)
    valid_age = same_gender.where(:age => (pet.age/2 + 7)..((pet.age-7)*2))
    same_personality = valid_age.where(:personality => pet.personality)
    if same_personality.size > 0
      return same_personality[0]
    elsif valid_age.size > 0
      return valid_age[0]
    elsif same_gender.size > 0
      return same_gender[0]
    else
      return different_user[0]
    end
  end 
end
