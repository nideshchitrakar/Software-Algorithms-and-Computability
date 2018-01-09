#!/usr/bin/env python3
"""
    main.py - Uses a simple Turing Machine to compute the following:
        (i) accept a string of 1s where number of 1s is even (commented out).
            replaces the 1s with ' '.
        (ii) return the sum of two numbers < 4 represented in binary where
             the tape input is in the form $0xx$0xxd - x is either 0 or 1 and xx
             represents the number in binary notation. the result is in the format
             $000$xxxd - xxx is the sum in binary notation.

    Author: Nidesh Chitrakar (nideshchitrakar@bennington.edu)
    Date: 11/15/2017
"""

from turing_machine import TuringMachine

if __name__ == '__main__':
    # transition_function = {("state_0","1"):("state_1", " ", "R"),
    #                        ("state_1","1"):("state_0", " ", "R"),
    #                        ("state_0"," "):("accept", " ", "R"),
    #                        ("state_1"," "):("reject", "1", "N")
    #                       }
    # final_states = {"accept", "reject"}
    # alphabets = ["1", " "]
    #
    # t = TuringMachine("111111",
    #                   alphabets,
    #                   initial_state = "state_0",
    #                   final_states = final_states,
    #                   transition_function = transition_function)

    transition_function = {("state_0","$"):("state_1", "$", "R"),
                           ("state_1","0"):("state_1", "0", "R"),
                           ("state_1","$"):("accept", "$", "R"),
                           ("state_1","1"):("state_2", "1", "R"),
                           ("state_2","0"):("state_2", "0", "R"),
                           ("state_2","1"):("state_2", "1", "R"),
                           ("state_2","$"):("state_3", "$", "L"),
                           ("state_3","0"):("state_3", "1", "L"),
                           ("state_3","1"):("state_4", "0", "R"),
                           ("state_4","0"):("state_4", "0", "R"),
                           ("state_4","1"):("state_4", "1", "R"),
                           ("state_4","$"):("state_4", "$", "R"),
                           ("state_4","d"):("state_5", "d", "L"),
                           ("state_5","1"):("state_5", "0", "L"),
                           ("state_5","0"):("state_6", "1", "L"),
                           ("state_6","0"):("state_6", "0", "L"),
                           ("state_6","1"):("state_6", "1", "L"),
                           ("state_6","$"):("state_7", "$", "L"),
                           ("state_7","0"):("state_7", "0", "L"),
                           ("state_7","1"):("state_7", "1", "L"),
                           ("state_7","$"):("state_1", "$", "R")
                          }
    final_states = {"accept"}
    alphabets = ["$","d","1","0"]

    t = TuringMachine("$010$011d",
                      alphabets,
                      initial_state = "state_0",
                      final_states = final_states,
                      transition_function = transition_function)

    print("Input on Tape:\n" + t.get_tape())

    while not t.final():
        t.step()

    print("Result of the Turing machine calculation:")
    print(t.get_tape())
