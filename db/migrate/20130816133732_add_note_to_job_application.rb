class AddNoteToJobApplication < ActiveRecord::Migration
  def change
    add_column :job_applications, :note, :string, default: JobApplication::NOTES[2]
  end
end
