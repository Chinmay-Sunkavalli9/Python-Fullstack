"""main.py - Entry point of the Online Examination & Result Management System.
Run with:  python main.py
"""

import utils
import question_manager
import student_manager
import exam
import result


def show_main_menu():
    utils.print_header("ONLINE EXAMINATION & RESULT MANAGEMENT SYSTEM")
    print("1. Question Management")
    print("2. Student Management")
    print("3. Start Examination")
    print("4. Results & Reports")
    print("5. Exit")


def main():
    utils.ensure_data_files()

    while True:
        show_main_menu()
        choice = utils.get_menu_choice(1, 5)

        if choice == 1:
            question_manager.question_menu()
        elif choice == 2:
            student_manager.student_menu()
        elif choice == 3:
            exam.start_exam()
        elif choice == 4:
            result.result_menu()
        else:
            print("\nThank you for using the system. Goodbye!")
            break


if __name__ == "__main__":
    try:
        main()
    except (KeyboardInterrupt, EOFError):
        print("\n\nProgram closed by user. Goodbye!")
