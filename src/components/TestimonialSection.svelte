<script lang="ts">
  import { onMount } from 'svelte';
  
  interface Testimonial {
    id: number;
    name: string;
    rating: number;
    text: string;
    treatment: string;
  }
  
  const testimonials: Testimonial[] = [
    {
      id: 1,
      name: "Sarah Johnson",
      rating: 5,
      text: "Dr. Smith and the team at 1460 Dental Studio are amazing! They made my dental implant procedure so comfortable and the results are incredible. I finally have my confidence back!",
      treatment: "Dental Implants"
    },
    {
      id: 2,
      name: "Mike Rodriguez", 
      rating: 5,
      text: "I was terrified of the dentist until I found this practice. The staff is so caring and patient. They explained everything and made sure I was comfortable throughout my root canal.",
      treatment: "Root Canal Therapy"
    },
    {
      id: 3,
      name: "Jennifer Chen",
      rating: 5,
      text: "The teeth whitening treatment here is fantastic! Professional, fast, and the results speak for themselves. I get compliments on my smile everywhere I go now.",
      treatment: "Teeth Whitening"
    },
    {
      id: 4,
      name: "David Thompson",
      rating: 5,
      text: "Outstanding service from start to finish. The office is modern and clean, and Dr. Smith's expertise with Invisalign gave me the straight smile I always wanted.",
      treatment: "Invisalign"
    }
  ];
  
  let currentIndex = 0;
  let isAutoPlaying = true;
  
  function nextTestimonial() {
    currentIndex = (currentIndex + 1) % testimonials.length;
  }
  
  function previousTestimonial() {
    currentIndex = currentIndex === 0 ? testimonials.length - 1 : currentIndex - 1;
  }
  
  function goToTestimonial(index: number) {
    currentIndex = index;
    isAutoPlaying = false;
  }
  
  onMount(() => {
    const interval = setInterval(() => {
      if (isAutoPlaying) {
        nextTestimonial();
      }
    }, 5000);
    
    return () => clearInterval(interval);
  });
</script>

<section class="py-24 bg-primary-50 dark:bg-primary-950">
  <div class="container mx-auto px-4">
    <!-- Section Header -->
    <div class="text-center mb-16">
      <h2 class="text-4xl md:text-5xl font-bold mb-6 text-surface-900 dark:text-surface-100">
        What Our Patients Say
      </h2>
      <p class="text-xl text-surface-600 dark:text-surface-400 max-w-3xl mx-auto">
        Don't just take our word for it. Here's what our patients have to say about their experience at 1460 Dental Studio.
      </p>
    </div>
    
    <!-- Testimonial Carousel -->
    <div class="max-w-4xl mx-auto">
      <div class="card p-8 md:p-12 text-center relative overflow-hidden">
        <!-- Background decoration -->
        <div class="absolute top-0 left-0 w-24 h-24 text-primary-200 dark:text-primary-800 opacity-50">
          <svg fill="currentColor" viewBox="0 0 24 24">
            <path d="M14.017 21v-7.391c0-5.704 3.731-9.57 8.983-10.609l.995 2.151c-2.432.917-3.995 3.638-3.995 5.849h4v10h-9.983zm-14.017 0v-7.391c0-5.704 3.748-9.57 9-10.609l.996 2.151c-2.433.917-3.996 3.638-3.996 5.849h4v10h-10z"/>
          </svg>
        </div>
        
        <!-- Current Testimonial -->
        <div class="relative z-10">
          <!-- Stars -->
          <div class="flex justify-center mb-6">
            {#each Array(testimonials[currentIndex].rating) as _, i}
              <svg class="w-6 h-6 text-yellow-400 fill-current" viewBox="0 0 24 24">
                <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
              </svg>
            {/each}
          </div>
          
          <!-- Quote -->
          <blockquote class="text-xl md:text-2xl text-surface-700 dark:text-surface-300 mb-8 leading-relaxed italic">
            "{testimonials[currentIndex].text}"
          </blockquote>
          
          <!-- Author Info -->
          <div>
            <div class="font-semibold text-lg text-surface-900 dark:text-surface-100">
              {testimonials[currentIndex].name}
            </div>
            <div class="text-primary-600 dark:text-primary-400">
              {testimonials[currentIndex].treatment}
            </div>
          </div>
        </div>
      </div>
      
      <!-- Navigation -->
      <div class="flex justify-center items-center mt-8 space-x-4">
        <!-- Previous Button -->
        <button 
          class="btn-icon variant-filled-surface"
          on:click={previousTestimonial}
          aria-label="Previous testimonial"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
          </svg>
        </button>
        
        <!-- Dots -->
        <div class="flex space-x-2">
          {#each testimonials as _, index}
            <button
              class="w-3 h-3 rounded-full transition-colors {index === currentIndex ? 'bg-primary-600' : 'bg-surface-300 dark:bg-surface-600'}"
              on:click={() => goToTestimonial(index)}
              aria-label="Go to testimonial {index + 1}"
            />
          {/each}
        </div>
        
        <!-- Next Button -->
        <button 
          class="btn-icon variant-filled-surface"
          on:click={nextTestimonial}
          aria-label="Next testimonial"
        >
          <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
          </svg>
        </button>
      </div>
    </div>
    
    <!-- CTA -->
    <div class="text-center mt-12">
      <p class="text-lg text-surface-600 dark:text-surface-400 mb-6">
        Ready to experience the difference for yourself?
      </p>
      <a href="/contact/" class="btn variant-filled-primary text-lg px-8 py-4">
        Schedule Your Appointment Today
      </a>
    </div>
  </div>
</section> 