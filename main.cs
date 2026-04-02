
using System;

Console.WriteLine("What is your name?");
string name = Console.ReadLine();

Console.WriteLine($"Hello, {name}! Today is {DateTime.Now:dddd}.");

void SayGoodbye() => Console.WriteLine("Goodbye!");
SayGoodbye();
