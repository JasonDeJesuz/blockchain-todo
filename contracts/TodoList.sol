pragma solidity ^0.5.0;

contract TodoList {
  constructor() public {
    createTask("yo dude");
  }

  uint public taskCount = 0;

  struct Task {
    uint id;
    string content;
    bool completed;
  }

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  mapping(uint => Task) public tasks;

  function createTask(string memory _content) public {
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
}

/* createTask */
// First, we create the function with the function keyword, and give it a name createTask()
// We allow the function to accept one argument called _content, which will be the text for the task. 
// We specify that this argument will be of string data type, and that it will persist in memory
// We set the function visibility to public so that it can be called outside of the smart contract, like in the console, or from the client side for example
// Inside the function, we create an id for the new task. We simply take the existing taskCount and increment it by 1.
// Now we create a new task struct by calling Task(taskCount, _content, false); and passing in the values for the new task.
// Next, we store the new task on the blockchain by adding it to the tasks mapping like this: task[taskCount] = ....