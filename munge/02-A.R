library("ProjectTemplate")

setwd("C:/Users/C1032379-localadmin/OneDrive - Newcastle University/5_CSC8631_Data_Management/Assignment/FL_Rproject")

load.project()

glimpse(cyber.security.1_enrolments)
glimpse(cyber.security.2_enrolments)
glimpse(cyber.security.3_enrolments)
glimpse(cyber.security.4_enrolments)
glimpse(cyber.security.5_enrolments)
glimpse(cyber.security.6_enrolments)
glimpse(cyber.security.7_enrolments)


cyber.security.1_enrolments$run = 1
cyber.security.2_enrolments$run = 2
cyber.security.3_enrolments$run = 3
cyber.security.4_enrolments$run = 4
cyber.security.5_enrolments$run = 5
cyber.security.6_enrolments$run = 6
cyber.security.7_enrolments$run = 7

merged_enrolments = cyber.security.1_enrolments %>%
  full_join(cyber.security.2_enrolments)


cyber.security.1_enrolments %>% 
  summarise(count = n_distinct(learner_id))

# changing the factors to characters so that I can find the counts of each country
enrolled_countries = cyber.security.1_enrolments %>% 
  mutate_if(is.factor, as.character) %>%
  select(detected_country) %>%
  count(detected_country) 

enrolled_countries %>% 
  select(n) %>% 
  max()
which.max(enrolled_countries$n == 4939)   # answer was GB

ggplot(enrolled_countries, aes(x=reorder(detected_country, -n), y=n)) +
  geom_col(stat = "identity", fill="purple", position = "identity") +
  theme_light() +
  labs(title = "Number of student enrollments by country",
       x = "Country", y = "Numbers of enrollment") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  # guides(x = guide_axis(n.dodge = 4))

ggplot(enrolled_countries, aes(x=n, y=detected_country)) +
  geom_col(stat = "identity", fill="purple", position = "identity") +
  theme_light() +
  labs(title = "Number of student enrollments by country",
       x = "Country", y = "Numbers of enrollment") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
# guides(x = guide_axis(n.dodge = 4))


ggplot(enrolled_countries, aes(x=detected_country, y=n)) +
  geom_point(aes(colour=factor(detected_country))) +
  theme_light() +
  labs(title = "Number of student enrollments by country",
       x = "Country", y = "Numbers of enrollment") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1, size=10))
# # guides(x = guide_axis(n.dodge = 4))







### want to combine files
### want to figure out what to plot
### want to figure out how to seperate time from the date (same column)
### changing unknown to NA

###
glimpse(cyber.security.3_video.stats)
glimpse(cyber.security.4_video.stats)
glimpse(cyber.security.5_video.stats)
glimpse(cyber.security.6_video.stats)
glimpse(cyber.security.7_video.stats)


# Adding an extra column to each dataset to differentiate which run it is
run3_vid_stats <- cyber.security.3_video.stats %>%
  mutate(cyber.security.3_video.stats, run_ = 3)

run4_vid_stats <- cyber.security.4_video.stats %>%
  mutate(cyber.security.4_video.stats, run_ = 4)

run5_vid_stats <- cyber.security.5_video.stats %>%
  mutate(cyber.security.5_video.stats, run_ = 5)

run6_vid_stats <- cyber.security.6_video.stats %>%
  mutate(cyber.security.6_video.stats, run_ = 6)

run7_vid_stats <- cyber.security.7_video.stats %>%
  mutate(cyber.security.7_video.stats, run_ = 7)

# joining the datasets together (to make it easier to wrangle)
joined_vid_stats1 <- full_join(run3_vid_stats, run4_vid_stats)
joined_vid_stats2 <- full_join(joined_vid_stats1, run5_vid_stats)
joined_vid_stats3 <- full_join(joined_vid_stats2, run6_vid_stats)
finaljoin_vid_stats <- full_join(joined_vid_stats3, run7_vid_stats)
