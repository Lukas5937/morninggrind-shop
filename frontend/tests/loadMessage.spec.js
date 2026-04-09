import { test, expect } from '@playwright/test'

test('loads message from backend', async ({ page }) => {
  await page.goto('http://localhost')
  await page.getByText('Load Message').click()
  await expect(page.getByText('Hello MorningGrind')).toBeVisible()
})
