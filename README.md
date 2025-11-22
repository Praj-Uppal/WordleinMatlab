# Wordle in MATLAB

A MATLAB implementation of the popular Wordle game, developed as part of a university project. This repository showcases the final code, project architecture, testing, and a demonstration of the game's functionality.

---

## Table of Contents

* [Demo Video](#demo-video)
* [Features](#features)
* [Architecture](#architecture)
* [Screenshots](#screenshots)
* [Testing](#testing)
* [Development History](#development-history)
* [Getting Started](#getting-started)
* [License](#license)

---

## Demo Video

Watch a live demonstration of the game:

[![Demo Video](media/Images/demoThumbnail.png)](https://youtu.be/S_3Ba9KBTno)

---

## Features

* Fully playable Wordle game in MATLAB
* Accepts user input and provides feedback per guess
* Tracks number of attempts and displays results
* Configurable word list
* Error handling for invalid input


---

## Architecture

The project is structured to separate game logic, testing, and documentation:

```
wordle-matlab/
│── src/                % All MATLAB source files
│── docs/               % Documentation, flowcharts, testing logs
│── media/              % Images, flowcharts, videos
│── dev-history/        % Optional: Day-by-day development notes
│── README.md
```
## How It's Made

* **Language & Environment**: MATLAB R2022a

* **Design Approach**: Modular development separating game logic, input validation, and display functionality

* **Flow Design**: Function flowcharts and game maps were used to ensure logic clarity

* **Testing**: Unit testing and driver scripts were developed alongside the main code to verify correctness

* **Documentation**: Detailed logs, screenshots, and reflections recorded during development

**Flowchart of game logic:**

![Game Flowchart](media/Images/Gameflowchartv2.png)

*For full set of flowcharts and function maps, see `/docs/charts&Maps/`.*

---

## Screenshots

**Gameplay Example:**
![Gameplay Screenshot](media/Images/Screenshot1.png)

---

## Testing

* Comprehensive testing of input validation and game logic
* Test drivers located in `/docs/testing/`
* Summary of test results and outcomes available in `/docs/testing-summary.pdf`

---

## Development History

Day-by-day reflections of development, testing, and iterations are stored in `/dev-history/`

---

## Getting Started

### Prerequisites

* MATLAB R2022a or later

### Running the Game

1. Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/wordle-matlab.git
```

2. Navigate to the `src` folder in MATLAB.
3. Run the gameStarter script:

```matlab
gameStarterwordle.m
```

---
## Optimizations & Lessons Learned
- **Code Optimizations:** Improved input validation, reduced redundant calculations, modularized repeated logic for readability  
- **Performance Improvements:** Minimized loops for efficiency, optimized word list lookups  
- **Lessons Learned:**  
  - Importance of planning logic flow before coding  
  - Modular design simplifies testing and future extensions  
  - Clear documentation and screenshots are invaluable for showcasing the project  
  - Version control and structured folder organization prevent clutter and make the project easy to maintain

## License

This project is licensed under the MIT License. See `LICENSE` for details.

---

*For additional resources, testing reports, and development notes, refer to the `/docs/` and `/dev-history/` folders.*
