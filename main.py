#!/usr/bin/env python3

import logging

from nicegui import ui


@ui.page('/todos')
def todolist():
    import todos
    logging.info(f"Added {todos}")


@ui.page('/stories')
def stories_index():
    with open('data/index.md', encoding="utf-8") as story:
        content = story.read()
    ui.markdown(content)


@ui.page('/stories/{item_id}')
def stories(item_id: str = 'index'):
    import stories
    logging.info(f"Added {stories}")
    ui.label('CONTENT')
    with open(f'data/{item_id}.md', encoding="utf-8") as story:
        content = story.read()
    ui.markdown(content)

    with ui.header(elevated=True).style('background-color: #3874c8').classes('items-center justify-between'):
        ui.label('HEADER')


@ui.page('/page_layout')
def page_layout():
    ui.label('CONTENT')
    [ui.label(f'Line {i}') for i in range(100)]
    with ui.header(elevated=True).style('background-color: #3874c8').classes('items-center justify-between'):
        ui.label('HEADER')
        ui.button(on_click=lambda: right_drawer.toggle(), icon='menu').props('flat color=white')
    with ui.left_drawer(top_corner=True, bottom_corner=True).style('background-color: #d7e3f4'):
        ui.label('LEFT DRAWER')
    with ui.right_drawer(fixed=False).style('background-color: #ebf1fa').props('bordered') as right_drawer:
        ui.label('RIGHT DRAWER')
    with ui.footer().style('background-color: #3874c8'):
        ui.label('FOOTER')


@ui.page('/')
def index():
    ui.link('Visit todos', todolist)
    ui.link('show page with fancy layout', page_layout)


ui.run(
    title="T.V.K. Enterprises",
    show=False,
    dark=True,
    uvicorn_logging_level="warning"  # default
)
