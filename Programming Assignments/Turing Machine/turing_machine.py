"""
    turing_machine.py - Contains definitions for a Tape and a simple Turning Machine
    Author: Nidesh Chitrakar (nideshchitrakar@bennington.edu)
    Date: 11/15/2017
"""

class Tape(object):
    """
    Tape object takes in tape string and returns a dictionary with key value being
    the index of a character and value being the character.
    """
    blank_symbol = " "

    def __init__(self, tape_string = ""):
        self.tape = dict(enumerate(tape_string))
        # print('tape = {0}'.format(self.tape))

    def __str__(self):
        s = ""
        min_used_index = min(self.tape.keys())
        max_used_index = max(self.tape.keys())
        for i in range(min_used_index, max_used_index + 1):
            s += self.tape[i]
        return s

    def __getitem__(self,index):
        if index in self.tape:
            return self.tape[index]
        else:
            return Tape.blank_symbol

    def __setitem__(self, pos, char):
        self.tape[pos] = char


class TuringMachine(object):

    def __init__(self,tape,alphabets,blank_symbol = " ",initial_state = "",final_states = None,transition_function = None):
        """
        Feed the Turing machine a tape and the list of functions to operate as well
        as the initial and final states.
        :param tape: Tape object, a dictionary containing input to process
        :param alphabets: List
        :param blank_symbol: String
        :param initial_state: String
        :param final_states: List
        :transition_function: List
        """
        self.tape = Tape(tape)
        self.head_position = 0
        self.blank_symbol = blank_symbol
        self.current_state = initial_state
        self.alphabets = alphabets
        if transition_function == None:
            self.transition_function = {}
        else:
            self.transition_function = transition_function
        if final_states == None:
            self.final_states = set()
        else:
            self.final_states = set(final_states)

    def get_tape(self):
        """
        Returns the value on the tape as a string.
        """
        return str(self.tape)

    def step(self):
        """
        Reads the character at an index and according to the state the machine is
        in, it runs the assigned function.
        """
        char_under_head = self.tape[self.head_position]
        x = (self.current_state, char_under_head)
        #print('current state = {0}'.format(x))
        if x in self.transition_function:
            y = self.transition_function[x]
            #print('current function = {0}'.format(y))
            #print('set value of position {0} = \'{1}\' to \'{2}\''.format(self.head_position,self.tape[self.head_position],y[1]))
            self.tape[self.head_position] = y[1]
            if y[2] == "R":
                self.head_position += 1
            elif y[2] == "L":
                self.head_position -= 1
            self.current_state = y[0]

    def final(self):
        """
        Checks if the character on the tape is recognized by the machine or not.
        Also checks if the machine has reached its end states.
        """
        if self.tape[self.head_position] not in self.alphabets:
            print('Character \'{0}\' not recognized!'.format(self.tape[self.head_position]))
            return True
        elif self.current_state in self.final_states:
            return True
        else:
            return False
