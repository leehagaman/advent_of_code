# for pypy


with open("input_day_16.txt") as file:
    
    text = file.read()


lines = text.strip().split("\n")

adjacencies = {}
flow_rates = {}
for l in lines:
    
    words = l.split()
    
    xs = words[9:]
    adjacencies[words[1]] = [x.split(",")[0] for x in xs]
    
    flow_rates[words[1]] = int(words[4].split("=")[1].split(";")[0])
    

    
all_rooms = list(flow_rates.keys())


total_possible_flow_rate = sum(list(flow_rates.values()))
print(total_possible_flow_rate)



def generate_list_from_you_move(current_state): # these don't have the time step applied
    
    current_open_valves = current_state[0]
    current_flow_rate = current_state[1]
    current_you_room = current_state[2]
    current_elephant_room = current_state[3]
    you_rooms_since_last_valve = current_state[4]
    elephant_rooms_since_last_valve = current_state[5]
    current_amount_flowed = current_state[6]
    num_remaining_minutes = current_state[7]
    you_doing_nothing = current_state[8]
    elephant_doing_nothing = current_state[9]
        
    ret = []
    
    for next_you_room in adjacencies[current_you_room]:

        if next_you_room in you_rooms_since_last_valve: # we were just there, useless move
            continue
        
        ret.append([current_open_valves, 
                                current_flow_rate, 
                                next_you_room, current_elephant_room, 
                                you_rooms_since_last_valve + [next_you_room], elephant_rooms_since_last_valve, 
                                current_amount_flowed,
                                num_remaining_minutes, 
                                you_doing_nothing, elephant_doing_nothing])
        
    #print("in function", [x[2] for x in ret])
         
    return ret
                   
def generate_state_from_you_valve(current_state):
    
    current_open_valves = current_state[0]
    current_flow_rate = current_state[1]
    current_you_room = current_state[2]
    current_elephant_room = current_state[3]
    you_rooms_since_last_valve = current_state[4]
    elephant_rooms_since_last_valve = current_state[5]
    current_amount_flowed = current_state[6]
    num_remaining_minutes = current_state[7]
    you_doing_nothing = current_state[8]
    elephant_doing_nothing = current_state[9]
    
    ret = []
    
    if flow_rates[current_you_room] > 0 and not (current_you_room in current_open_valves): # open valve
        
        ret.append([current_open_valves + [current_you_room], 
                                current_flow_rate + flow_rates[current_you_room], 
                                current_you_room, current_elephant_room, 
                                [current_you_room], elephant_rooms_since_last_valve, 
                                current_amount_flowed,
                                num_remaining_minutes, 
                                you_doing_nothing, elephant_doing_nothing])

    return ret
    
    
def generate_list_from_elephant_move(current_state): # these don't have the time step applied
    
    current_open_valves = current_state[0]
    current_flow_rate = current_state[1]
    current_you_room = current_state[2]
    current_elephant_room = current_state[3]
    you_rooms_since_last_valve = current_state[4]
    elephant_rooms_since_last_valve = current_state[5]
    current_amount_flowed = current_state[6]
    num_remaining_minutes = current_state[7]
    you_doing_nothing = current_state[8]
    elephant_doing_nothing = current_state[9]
    
    ret = []
    
    for next_elephant_room in adjacencies[current_elephant_room]:

        if next_elephant_room in elephant_rooms_since_last_valve: # we were just there, useless move
            continue
        
        ret.append([current_open_valves, 
                                current_flow_rate, 
                                current_you_room, next_elephant_room, 
                                you_rooms_since_last_valve, elephant_rooms_since_last_valve + [next_elephant_room], 
                                current_amount_flowed,
                                num_remaining_minutes, 
                                you_doing_nothing, elephant_doing_nothing])
                   
    return ret
                   
def generate_state_from_elephant_valve(current_state):
    
    current_open_valves = current_state[0]
    current_flow_rate = current_state[1]
    current_you_room = current_state[2]
    current_elephant_room = current_state[3]
    you_rooms_since_last_valve = current_state[4]
    elephant_rooms_since_last_valve = current_state[5]
    current_amount_flowed = current_state[6]
    num_remaining_minutes = current_state[7]
    you_doing_nothing = current_state[8]
    elephant_doing_nothing = current_state[9]
    
    ret = []
    
    if flow_rates[current_elephant_room] > 0 and not (current_elephant_room in current_open_valves): # open valve
        
        ret.append([current_open_valves + [current_elephant_room], 
                                current_flow_rate + flow_rates[current_elephant_room], 
                                current_you_room, current_elephant_room, 
                                you_rooms_since_last_valve, [current_elephant_room], 
                                current_amount_flowed,
                                num_remaining_minutes, 
                                you_doing_nothing, elephant_doing_nothing])

    return ret


q = []


current_open_valves = []
current_flow_rate = 0
current_you_room = 'AA'
current_elephant_room = 'AA'
you_rooms_since_last_valve = ['AA']
elephant_rooms_since_last_valve = ['AA']
current_amount_flowed = 0
num_remaining_minutes = 26
you_doing_nothing = False
elephant_doing_nothing = False


current_state = [current_open_valves, 
                 current_flow_rate, 
                 current_you_room, current_elephant_room, 
                 you_rooms_since_last_valve, elephant_rooms_since_last_valve, 
                 current_amount_flowed,
                 num_remaining_minutes, 
                 you_doing_nothing, elephant_doing_nothing]


q.append(current_state) # putting the first point with estimated cost


min_num_printed_minutes = 26

max_possible_total_flow = 0

num_states_considered = 0

prev_considered_states = set()

while not len(q) == 0:
    
    
    if num_states_considered % 10000 == 0:
        print("num considered", num_states_considered)
        
    #print("starting a loop")

    
    current_state = q.pop(0)
    #print(current_state)
    
    num_states_considered += 1
        
    current_open_valves = current_state[0]
    current_flow_rate = current_state[1]
    current_you_room = current_state[2]
    current_elephant_room = current_state[3]
    you_rooms_since_last_valve = current_state[4]
    elephant_rooms_since_last_valve = current_state[5]
    current_amount_flowed = current_state[6]
    num_remaining_minutes = current_state[7]
    you_doing_nothing = current_state[8]
    elephant_doing_nothing = current_state[9]
    
    next_amount_flowed = current_amount_flowed + current_flow_rate
    
    if num_remaining_minutes == 0:
        
        if current_amount_flowed > max_possible_total_flow:
            max_possible_total_flow = max(max_possible_total_flow, current_amount_flowed)
            print("new max possible flow,", max_possible_total_flow)
            
        continue
        
    if set(current_open_valves) == set(all_rooms): # nothing left to do
        next_state = [current_open_valves, 
                 current_flow_rate, 
                 current_you_room, current_elephant_room, 
                 you_rooms_since_last_valve, elephant_rooms_since_last_valve, 
                 current_amount_flowed + current_flow_rate,
                 num_remaining_minutes - 1, 
                     you_doing_nothing, elephant_doing_nothing]
            
        q.append(next_state)
        continue
        
    if current_amount_flowed + total_possible_flow_rate * num_remaining_minutes <= max_possible_total_flow:
        continue # could never beat the current best
        
    if ((tuple(current_open_valves), 
                      current_you_room, current_elephant_room, 
                      current_amount_flowed,
                      num_remaining_minutes) in prev_considered_states) or ((tuple(current_open_valves), 
                      current_elephant_room, current_you_room, 
                      current_amount_flowed,
                      num_remaining_minutes) in prev_considered_states):
        continue # considered this before
    else:
        prev_considered_states.add((tuple(current_open_valves), 
                      current_you_room, current_elephant_room, 
                      current_amount_flowed,
                      num_remaining_minutes))
        
    #if current_you_room == "II" and current_elephant_room == "DD":
    #    print(predicted_cost(current_state), current_state)
    
    
    if you_doing_nothing:
        your_choices = [2]
    else:
        your_choices = [0, 1, 2]
        
    if elephant_doing_nothing:
        elephant_choices = [2]
    else:
        elephant_choices = [0, 1, 2]
        
    new_you_doing_nothing = you_doing_nothing
    for your_choice in your_choices:
        
        #print("your_choice", your_choice)
        
        if your_choice == 0: # open valve
        
            next_states = generate_state_from_you_valve(current_state)
            if next_states == []:
                continue
                
        if your_choice == 1: # move
            
            next_states = generate_list_from_you_move(current_state)
            #print("moved you", next_states)
            if next_states == []:
                continue
                
        if your_choice == 2: # do nothing
            
            next_states = [current_state]
            new_you_doing_nothing = True
            
        #print("next states:", next_states)
            
        for s in next_states: # iterating over the new partial states from the you move
            
            new_elephant_doing_nothing = elephant_doing_nothing
            for elephant_choice in elephant_choices:

                #print("elephant_choice", elephant_choice)

                if elephant_choice == 0: # open valve

                    next_states_2 = generate_state_from_elephant_valve(s)
                    if next_states_2 == []:
                        continue

                if elephant_choice == 1: # move

                    next_states_2 = generate_list_from_elephant_move(s)
                    if next_states_2 == []:
                        continue

                if elephant_choice == 2: # do nothing
                    
                    next_states_2 = [s]
                    new_elephant_doing_nothing = True
                    
                #if your_choice == 1 and elephant_choice == 1:
                    #print("choices", your_choice, elephant_choice)
                    #print(next_states_2)
                    
                for s2 in next_states_2:
                    final_state = [s2[0], 
                                    s2[1], 
                                    s2[2], s2[3], 
                                    s2[4], s2[5],
                                    next_amount_flowed,
                                    s2[7] - 1,
                                    new_you_doing_nothing, new_elephant_doing_nothing]

                    q.append(final_state)
                    
                    #print("size: ", q.qsize(), q.empty())
                
            
                
print("exhausted all possibilities")

