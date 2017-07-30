require 'test_helper'

class Admin::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
  	@classroom = classrooms(:one)
  	@lesson = lessons(:one)
    sign_as_admin
  end

  test "should get index" do
    get admin_classroom_lessons_path(@classroom)
    assert_response :success
  end

  test "should get new" do
    get new_admin_classroom_lesson_path(@classroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_classroom_lesson_path(@classroom, @lesson)
    assert_response :success
  end

  test "should create lesson" do
    post admin_classroom_lessons_path(@classroom), params: { lesson: {classroom_id: @classroom.id, day: "Quinta", schoolroom_id: schoolrooms(:two).id, laboratory_id: nil, campus_schedule_id: campus_schedules(:two).id }}
    assert_redirected_to admin_classroom_lessons_path(@classroom)
  end
  
  test "should update lesson" do
    patch admin_classroom_lesson_path(@classroom, @lesson), params: { lesson: {classroom_id: @classroom.id, day: "Terça", schoolroom_id: schoolrooms(:one).id, laboratory_id: nil, campus_schedule_id: campus_schedules(:one).id } }
    assert_redirected_to admin_classroom_lessons_path(@classroom)
  end

  test "should not create a lesson without schoolroom and laboratory" do
    post admin_classroom_lessons_path(@classroom), params: { lesson: {classroom_id: @classroom.id, day: "Terça", schoolroom_id: schoolrooms(:one).id, laboratory_id: nil, campus_schedule_id: campus_schedules(:one).id } }
    assert_no_match 'Aula criada com sucesso', @response.body.to_s
  end

  test "should not update lesson without schoolroom and laboratory" do
    patch admin_classroom_lesson_path(@classroom, @lesson), params: { lesson: {classroom_id: @classroom.id, day: "Quinta", schoolroom_id: nil, laboratory_id: nil, campus_schedule_id: campus_schedules(:two).id } }
    assert_no_match 'Aula atualizada com sucesso', @response.body.to_s
  end

  test "should destroy lesson" do
    delete admin_classroom_lesson_path(@classroom, @lesson)
    assert_redirected_to admin_classroom_lessons_path(@classroom)
  end
end
