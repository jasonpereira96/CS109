import queue

adj_list = {
  '2': ['3', '4'],
  '3': ['5', '6'],
  '4': ['7', '8'],
  '5': [],
  '6': [],
  '7': [],
  '8': [],
}

seen = set()

queue_ = queue.SimpleQueue()
source = '2'
target = '8'

queue_.put(source)


while not queue_.empty():
  node = queue_.get()
  
  if node not in seen:
    # process node
    print(node)

    if node == target:
      print('found target')
      break

    seen.add(node)

    for adj_node in adj_list[node]:
      queue_.put(adj_node)    

