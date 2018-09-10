get '/users/:id/question' do
  @q = Question.all 
  erb :'/question/questions'
end

get '/question' do
  @q = Question.all 
  erb :'/question/questions'
end


get '/user/:id/question/:q_id/update' do

  
  @q = Question.find(params[:q_id])

  erb :'/question/update'
end

post "/submit" do

  @q = Question.new(question: params[:question], user_id: current_user.id )
  
  if @q.save
    redirect "/question"
  else
    puts "Please enter a valid question"
  end

end


delete '/delete/:id' do

  @q = Question.find(params[:id])
 if @q.destroy
  redirect "/users/:id/question"
  else
    puts "Error"
  end
end

post '/edit' do
  redirect "/users/:id/question/:q_id/update"

end


post '/users/:id/question/:q_id/update' do

  @q = Question.find(params[:q_id])
  @q.question = params["question"]
  
  if @q.save
    redirect "/users/#{current_user.id}/question"
  else
    puts "Please enter a valid question"
  end

end