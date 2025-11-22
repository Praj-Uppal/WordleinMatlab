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

## License

This project is licensed under the MIT License. See `LICENSE` for details.

---

*For additional resources, testing reports, and development notes, refer to the `/docs/` and `/dev-history/` folders.*
