local function set_journal_title()
    local date  = os.date ("%a %d/%m") --> Wednesday, 04 April 2007
    return date
end

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
    org_agenda_files = {'~/Org/*', '~/Org/readings/*'},
    org_default_notes_file = '~/Org/refile.org',
    org_todo_keywords = {'TODO(t)', 'PAUSE(p)', 'MEETING', 'CURRENT(c)', 'NEXT(n)', '|', 'DONE(d)'},
    org_todo_keyword_faces = {
        NEXT = ':foreground orange :weight bold',
        PAUSE = ':foreground gray :weight bold',
        CURRENT = ':foreground cyan :weight bold',
    },
    -- win_split_mode = "float",                       -- Tabnew
    org_hide_leading_stars  = true,                  -- Muestra una única star en el header. solo indenta
    org_hide_emphasis_markers = true,               -- Conceal level for bold/italic/underline/code/verbatim
    org_ellipsis = " ﬋",                             -- Marker used to indicate a folded headline.
    org_highlight_latex_and_related="entities",     -- How to handle latex syntax. entities > only in certain modes. native > ALL. nil > none
    mappings = {
        agenda = {
            org_agenda_later = 'J',
            org_agenda_earlier = 'K',
            org_agenda_goto_date = 'G'
        },
        capture = {
            org_capture_kill = 'q',
            org_foward_heading_same_level = '}',
            org_backward_heading_same_level = '{',
            org_next_visible_heading = ']]',
            org_previous_visible_heading = '[[',
        }
    },
    org_capture_templates = {
        t = {
            description = 'Todo',
            template = '* TODO %?',
            targe = '~/Org/refile.org'
        },
        m = {
            description = 'Meeting',
            template = '* MEETING %?\n SCHEDULE: %T ',
            targe = '~/Org/phd.org'
        },
        j = {
            description = 'Journal',
            template = '*** '..set_journal_title()..'\n %?  ',
            target = '~/Org/journal.org'
        },
        r = {
            description = 'Reading',
            template = '** TODO [R] %? \n Notes -> [[file:$HOME/Org/readings/]] \n File -> [[file:$HOME/Phd/Database/Papers/]]   ',
            target = '~/Org/readings/readings.org'
        }
    }
})

require("org-bullets").setup {
    concealcursor = false, 
}
