get '/user/:id/question/:q_id/answer' do

  
  @q = Question.find(params[:q_id])

  erb :'/question/answers'
end

get '/users/:id/question/:q_id/answer/:a_id/update' do
	@q = Question.find(params[:q_id])
	@a = Answer.find(params[:a_id])
	erb :'/answer/update'
end
post '/users/:id/question/:q_id/answer' do
	@q = Question.find(params[:q_id])
  @answer = @q.answers.new(answer: params[:answer], user_id: current_user.id )
 

  if @answer.save
    redirect "/users/#{current_user.id}/question"
  else
    puts "Please enter a valid answer"
  end

end

post '/users/:id/question/:q_id/answer/:a_id/update' do
  @q = Question.find(params[:q_id])
  @a = Answer.find(params[:a_id])
  @a.answer = params["answer"]
  
  if @a.save
    redirect "/users/#{current_user.id}/question"
  else
    puts "Please enter a valid answer"
  end

end

delete '/users/:id/question/:q_id/answer/:a_id/delete' do

  @a = Answer.find(params[:a_id])
 if @a.destroy
  redirect "/users/:id/question"
  else
    puts "Error"
  end
end